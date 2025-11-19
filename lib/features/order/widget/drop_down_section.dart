import 'package:coffee_app/features/order/widget/section_title.dart';
import 'package:flutter/material.dart';

import 'custom_drop_down_button.dart';

class DropDownSection extends StatefulWidget {
  final String title;
  final List<String> items;
  final String hint;
  final ValueChanged<String?>? onChanged;

  const DropDownSection({
    super.key,
    required this.title,
    required this.items,
    required this.hint,
    this.onChanged,
  });

  @override
  State<DropDownSection> createState() => _DropDownSectionState();
}

class _DropDownSectionState extends State<DropDownSection> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(widget.title),
        const SizedBox(height: 10),
        CustomDropDownButton(
          initialValue: selectedValue,
          items: widget.items,
          hint: widget.hint,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
