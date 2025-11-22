import 'package:coffee_app/features/cart/widget/payment_method_section.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class DeliveryOptions extends StatelessWidget {
  final String? selectedOption;
  final ValueChanged<String> onChanged;

  const DeliveryOptions({
    super.key,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          deliveryTile(
            title: "As Soon as Possible",
            subtitle: "Now - 10 Minutes",
            value: "now",
          ),
          const Divider(height: 30),
          deliveryTile(
            title: "Later",
            subtitle: "Schedule Pick Up",
            value: "later",
          ),
          const Divider(height: 30),
          PaymentMethodSection()
        ],
      ),
    );
  }

  Widget deliveryTile({
    required String title,
    required String subtitle,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(subtitle),
          ],
        ),
        Radio(
          fillColor: const WidgetStatePropertyAll(AppColors.greenColor),
          value: value,
          groupValue: selectedOption,
          onChanged: (v) => onChanged(v!),
        ),
      ],
    );
  }
}
