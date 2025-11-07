import 'package:coffee_app/features/order/widget/quantity_selector.dart';
import 'package:coffee_app/features/order/widget/section_title.dart';
import 'package:flutter/material.dart';

class QuantitySection extends StatelessWidget {
  final String title;
  final String itemName;

  const QuantitySection({
    super.key,
    required this.title,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title),
        const SizedBox(height: 10),
        QuantitySelector(itemName: itemName),
        const SizedBox(height: 20),
      ],
    );
  }
}
