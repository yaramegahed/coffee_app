import 'package:flutter/material.dart';

import '../../../core/widget/quantity_container.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final Function(int) onQtyChanged;

  const CartItemCard({
    super.key,
    required this.order,
    required this.onQtyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              order["productName"] ?? "Unknown",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            const Spacer(),
            Text(
              "\$${order["price"] ?? 0}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "${order["cupSize"]}\n"
          "${order["flavorQty"]} Splenda\n"
          "${order["sweetenerQty"]} Pump(s) Pumpkin spice\n"
          "${order["creamer"]}\n"
          "${order["addIns"]}",
          style: const TextStyle(fontFamily: "Poppins"),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            QuantityContainer(
              initialQuantity: order["quantity"] ?? 1,
              onChanged: onQtyChanged,
            ),
            const Spacer(),
            Text(
              "\$${((order["quantity"]??1) * (order["price"] ?? 0)).toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
