import 'package:coffee_app/core/widget/quantity_container.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final ValueChanged<int>? onChanged;
  final String itemName;

  const QuantitySelector({super.key, required this.itemName, this.onChanged});

  @override
  QuantitySelectorState createState() => QuantitySelectorState();
}

class QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.itemName,
            style: const TextStyle(fontSize: 16),
          ),
          Spacer(),
          QuantityContainer(
            initialQuantity: quantity,
            onChanged: widget.onChanged,
          )
        ],
      ),
    );
  }
}
