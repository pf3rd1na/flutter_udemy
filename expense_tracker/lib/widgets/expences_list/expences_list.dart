import 'package:expense_tracker/widgets/expences_list/expences_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final Function onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctg, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin?.horizontal ?? 16,
            // vertical: Theme.of(context).cardTheme.margin?.vertical ?? 8,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        onDismissed: ((direction) {
          onRemoveExpense(expenses[index]);
        }),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
