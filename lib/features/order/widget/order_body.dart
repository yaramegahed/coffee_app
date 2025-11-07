import 'package:coffee_app/core/widget/custom_menu_categorized_row.dart';
import 'package:coffee_app/core/widget/custom_menu_items.dart';
import 'package:flutter/material.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (innerContext) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const CustomMenuCategorizedRow(menuTitle: "Drinks"),
            CustomMenuItems(
                onTap: () {
                  Navigator.of(innerContext).pushNamed('/details');
                },
                itemTitle: "Hot coffee",
                itemImage: "assets/images/Mixed Black Coffee1.png")
          ],
        ),
      );
    });
  }
}
