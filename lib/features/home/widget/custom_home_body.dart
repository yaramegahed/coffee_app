import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_home_order_container.dart';
import 'custom_menu_categorized_row.dart';
import 'custom_menu_items.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 22,
            ),
            Text(
              "Good Morning!",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Login and get free ☕️ ",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 18,
            ),
            CustomHomeOrderContainer(),
            CustomMenuCategorizedRow(
              menuTitle: 'Drinks',
            ),
            CustomMenuItems(
              itemTitle: "Hot Coffee",
              itemImage: "assets/images/Mixed Black Coffee1.png",
            ),
            CustomMenuCategorizedRow(
              menuTitle: 'Food',
            ),
            CustomMenuItems(
              itemTitle: "Hot Coffee",
              itemImage: "assets/images/Mixed Black Coffee1.png",
            ),
          ],
        ),
      ),
    );
  }
}
