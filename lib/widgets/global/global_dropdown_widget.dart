import 'package:flutter/material.dart';
import 'package:kweliscore/widgets/widgets.dart';

class GlobalDropdownWidget extends StatelessWidget {
  const GlobalDropdownWidget({
    Key? key,
    required this.items,
    this.value,
    required this.onChanged,
    required this.label,
  }) : super(key: key);
  final List<DropdownMenuItem<String>> items;
  final String label;
  final String? value;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items,
      value: value,
      onChanged: onChanged,
      icon: GlobalIcon(svgIcon: "assets/icons/dropdown.svg"),
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Choose',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      isExpanded: true,
    );
  }
}
