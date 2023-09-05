import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/error_manager.dart';
import 'package:shopping_list/http_manager.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/empty_list.dart';
import 'package:shopping_list/widgets/grocery.dart';

class GroceriesScreen extends ConsumerStatefulWidget {
  const GroceriesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GroceriesScreenState();
  }
}

class _GroceriesScreenState extends ConsumerState<GroceriesScreen> {
  final List<GroceryItem> _groceryItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final result = await HttpManager.get();

    if (context.mounted == false) {
      return;
    }

    if (result.statusCode != 200) {
      ErrorManager.showErrorSnackBar(result.body, context);
      return;
    }

    final Map<String, dynamic> parsedResult = json.decode(result.body);

    parsedResult.forEach((key, value) {
      _groceryItems.add(
        GroceryItem(
          id: key,
          name: value['name'],
          quantity: value['quantity'],
          category: categories.entries
              .firstWhere((element) => element.value.name == value['category'])
              .value,
        ),
      );
    });

    setState(() {
      _isLoading = false;
    });
  }

  void _createNewItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItemScreen(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final Response result;
    try {
      result = await HttpManager.delete(item.id);
    } catch (e) {
      ErrorManager.showErrorSnackBar(e, context);
      setState(() {
        _groceryItems.insert(index, item);
      });
      return;
    }

    if (context.mounted == false) {
      return;
    }

    if (result.statusCode != 200) {
      ErrorManager.showErrorSnackBar(result.body, context);
      setState(() {
        _groceryItems.insert(index, item);
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final groceries = ref.watch(groceriesProvider);
    Widget content = const EmptyList();

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: ((context, index) {
          return Dismissible(
              key: Key(_groceryItems[index].id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _removeItem(_groceryItems[index]);
              },
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              child: Grocery(grocery: _groceryItems[index]));
        }),
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Your Groceries',
          ),
          actions: [
            IconButton(
              onPressed: _createNewItem,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: content);
  }
}
