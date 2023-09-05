import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(onScreenSelected: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: Column(
        children: [
          FilterSwitch(
            filterSet: filters[FilterSwichType.glutenFree]!,
            filterName: 'Gluten-Free',
            filterDescription: 'Only include gluten-free meals',
            filterType: FilterSwichType.glutenFree,
            onChanged: ref.read(filtersProvider.notifier).toggleFilter,
          ),
          FilterSwitch(
            filterSet: filters[FilterSwichType.lactoseFree]!,
            filterName: 'Lactose-Free',
            filterDescription: 'Only include lactose-free meals',
            filterType: FilterSwichType.lactoseFree,
            onChanged: ref.read(filtersProvider.notifier).toggleFilter,
          ),
          FilterSwitch(
            filterSet: filters[FilterSwichType.vegetarian]!,
            filterName: 'Vegetarian',
            filterDescription: 'Only include vegetarian meals',
            filterType: FilterSwichType.vegetarian,
            onChanged: ref.read(filtersProvider.notifier).toggleFilter,
          ),
          FilterSwitch(
            filterSet: filters[FilterSwichType.vegan]!,
            filterName: 'Vegan',
            filterDescription: 'Only include vegan meals',
            filterType: FilterSwichType.vegan,
            onChanged: ref.read(filtersProvider.notifier).toggleFilter,
          ),
        ],
      ),
    );
  }
}
