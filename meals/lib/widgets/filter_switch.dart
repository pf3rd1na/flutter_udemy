import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    super.key,
    required this.filterSet,
    required this.filterName,
    required this.filterDescription,
    required this.filterType,
    required this.onChanged,
  });

  final bool filterSet;
  final String filterName;
  final String filterDescription;
  final FilterSwichType filterType;
  final Function(FilterSwichType, bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterSet,
      onChanged: (value) {
        onChanged(filterType, value);
      },
      title: Text(
        filterName,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        filterDescription,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
