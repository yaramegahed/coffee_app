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

    if ((order["customized"] ?? false) && category == "coffee") {
      if (order["cupSizes"] != null) {
        lines.add("${order["cupSizes"]}");
      }
      if (order["sweetenerOptions"] != null) {
        lines.add("${order["sweetenerOptions"]} Splenda");
      }
      if (order["flavorOptions"] != null) {
        lines.add("${order["flavorOptions"]} Pump(s) Pumpkin spice");
      }
      if (order["shotOptions "] != null) {
        lines.add("${order["shotOptions "]} (s) Espresso");
      }
      if (order["espressoOptions "] != null) {
        lines.add("${order["espressoOptions "]} ");
      }
      if (order["toppings"] != null) {
        lines.add("${order["toppings"]} Toppings");
      }
      if (order["creamers"] != null) {
        lines.add(order["creamers"]);
      }
      if (order["addIns"] != null) {
        lines.add(order["addIns"]);
      }
    } else if(category == "coffee"){
      if (order["cupSizes"] != null) {
        lines.add("${order["cupSizes"]}");
      }
      if (order["sweetenerOptions"] != null) {
        lines.add("${order["sweetenerOptions"]} Splenda");
      }
      if (order["flavorOptions"] != null) {
        lines.add("${order["flavorOptions"]} Pump(s) Pumpkin spice");
      }
      if (order["shotOptions "] != null) {
        lines.add("${order["shotOptions "]} (s) Espresso");
      }
      if (order["espressoOptions "] != null) {
        lines.add("${order["espressoOptions "]} ");
      }
      if (order["toppings"] != null) {
        lines.add("${order["toppings"]} Toppings");
      }
      if (order["creamers"] != null) {
        lines.add(order["creamers"]);
      }
      if (order["addIns"] != null) {
        lines.add(order["addIns"]);
      }
    }
    else if (category == "cookie") {
      if (order["flavors"] != null) lines.add(order["flavors"]??"No details available");
      if (order["sizes"] != null) lines.add(order["sizes"]);
      if (order["toppings"] != null) lines.add(order["toppings"]);
    } else {
      lines.add(order["productName"] ?? "Item");
      Text("No details available");
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
