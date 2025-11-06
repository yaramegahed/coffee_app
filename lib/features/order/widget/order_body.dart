import 'package:coffee_app/core/widget/custom_menu_categorized_row.dart';
import 'package:coffee_app/core/widget/custom_menu_items.dart';
import 'package:coffee_app/features/order/widget/product_details.dart';
import 'package:flutter/material.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const CustomMenuCategorizedRow(menuTitle: "Drinks"),
          CustomMenuItems(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(),
                    ));
              },
              itemTitle: "Hot coffee",
              itemImage: "assets/images/Mixed Black Coffee1.png")
        ],
      ),
    );
  }
}
