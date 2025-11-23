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
    final category = (order["category"] ?? "").toLowerCase();
    final quantity = order["quantity"] ?? 1;
    final price = order["price"] ?? 0;
    List<String> lines = [];

    if (category == "coffee") {
      lines.add(
          "${order["cupSizes"] ?? ""}, ${order["sweetenerOptions"] ?? 0} Splenda");
      lines.add("${order["flavorOptions"] ?? 0} Pump (s) Pumpkin spice");
      if (order["espressoShots"] != null) {
        lines.add("${order["espressoShots"]} Shot(s) Espresso");
      }
      if (order["toppings"] != null) {
        lines.add("${order["toppings"]} Toppings");
      }
      lines.add(order["creamers"] ?? "");
      lines.add(order["addIns"] ?? "");
    } else if (category == "cookie") {
      lines.add(order["flavors"] ?? "");
      lines.add(order["sizes"] ?? "");
      lines.add(order["toppings"] ?? "");
    } else {
      lines.add(order["productName"] ?? "Item");
    }

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
              "\$$price",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          lines.join("\n"),
          style: const TextStyle(fontFamily: "Poppins"),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            QuantityContainer(
              initialQuantity: quantity,
              onChanged: onQtyChanged,
            ),
            const Spacer(),
            Text(
              "\$${(quantity * price).toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Divider()
      ],
    );
  }
}
