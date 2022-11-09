import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class myDropDown extends StatefulWidget {
  myDropDown({
    super.key,
    required this.controller,
  });
  late TextEditingController controller;
  @override
  State<myDropDown> createState() => _myDropDownState(controller: controller);
}
class _myDropDownState extends State<myDropDown> {
  _myDropDownState({
    required this.controller,
  });
  late TextEditingController controller;
  @override
  final List<String> items = [
    "HR",
    "Finance",
    "Marketing",
    "HouseKeeping",
  ];
  String? selectedVal;
  Widget build(BuildContext context) {
    return DropdownButton2(
      hint: Text(
        'Enter Department',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selectedVal,
      onChanged: (value) {
        setState(() {
          selectedVal = value as String;
          controller.text = selectedVal!;
        });
      },
      buttonHeight: 60,
      buttonWidth: 400,
      itemHeight: 40,
    );
  }
}
