import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class QuantityContainer extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int>? onChanged;

  const QuantityContainer({super.key, required this.initialQuantity, this.onChanged});

  @override
  State<QuantityContainer> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantityContainer> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: AppColors.orangeColor,
            ),
            onPressed: () {
              if (quantity > 0) {
                setState(() {
                  quantity--;
                });
                widget.onChanged?.call(quantity);
              }
            },
          ),
          Container(
            width: 36,
            height: 24,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                '$quantity',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.orangeColor,
            ),
            onPressed: () {
              setState(() {
                quantity++;
              });
              widget.onChanged?.call(quantity);
            },
          ),
        ],
      ),
    );
  }
}
