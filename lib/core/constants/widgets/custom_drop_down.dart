import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  final ValueChanged<String> onValueChanged;

  const CustomDropDown(
      {super.key, required this.title, required this.onValueChanged});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final String _selectedVal = "0";
  final List<String> values = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: white,
      isExpanded: true,
      autofocus: true,
      decoration: InputDecoration(
        filled: true,
        focusedBorder: const UnderlineInputBorder(),
        labelText: tr(widget.title),
        border: const UnderlineInputBorder(),
      ),
      items: values.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Center(
            child: Text(
              dropDownStringItem,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) => widget.onValueChanged(value!),
      value: _selectedVal,
    );
  }
}
