import 'package:flutter/material.dart';
import 'package:tire_manager/models/dropdown_value.dart';

import '../../app_theme.dart';

class DropdownField extends StatelessWidget {
  final List<DropdownValue> values;
  final DropdownValue? selectedValue;
  final String emptyText;
  final String notContainedSelectedValueText;
  final String hintText;
  final void Function(int?) onSelect;
  const DropdownField({
    Key? key,
    required this.values,
    required this.selectedValue,
    required this.emptyText,
    required this.notContainedSelectedValueText,
    required this.hintText,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.filledCardDecoration,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    final selectedStyle = Theme.of(context).textTheme.caption;
    final unselectedStyle =
        selectedStyle!.copyWith(color: Colors.grey.shade700);
    if (values.isEmpty) {
      return Text(emptyText, style: unselectedStyle);
    } else if (!values
            .map((v) => v.dropdownId)
            .contains(selectedValue?.dropdownId) &&
        selectedValue != null) {
      return Text(notContainedSelectedValueText, style: unselectedStyle);
    }
    return DropdownButton<int>(
      underline: const SizedBox.shrink(),
      style: Theme.of(context).textTheme.caption,
      hint: Text(
        hintText,
        style: unselectedStyle,
      ),
      value: selectedValue?.dropdownId,
      isExpanded: true,
      items: values
          .map((e) => DropdownMenuItem<int>(
                value: e.dropdownId,
                child: Text(e.dropdownTitle),
              ))
          .toList(),
      onChanged: onSelect,
    );
  }
}
