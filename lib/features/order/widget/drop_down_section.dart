import 'package:coffee_app/features/order/widget/section_title.dart';
import 'package:flutter/material.dart';

import 'custom_drop_down_button.dart';

class DropDownSection extends StatelessWidget {
  final String title;
  final List<String> items;
  final String hint;

  const DropDownSection({
    super.key,
    required this.title,
    required this.items,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title),
        const SizedBox(height: 10),
        CustomDropDownButton(
          items: items,
          hint: hint,
          onChanged: (value) {},
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
