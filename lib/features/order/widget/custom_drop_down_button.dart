import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> items;
  final String hint;
  final Function(String?) onChanged;
  final String? initialValue; // بدل late final selectedValue

  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
    this.initialValue,
  });

  @override
  CustomDropDownButtonState createState() => CustomDropDownButtonState();
}

class CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(widget.hint),
          value: selectedValue,
          isExpanded: true,
          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          icon: CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.brownButtonColor,
            child: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onChanged(value);
          },
        ),
      ),
    );
  }
}

