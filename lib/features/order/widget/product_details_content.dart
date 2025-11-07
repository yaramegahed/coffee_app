import 'package:coffee_app/features/order/widget/quantity_section.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../home/widget/custom_button.dart';
import 'drop_down_section.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What's included",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        DropDownSection(
          title: "Cup Size",
          items: ["Large", "Small", "Med"],
          hint: "Choose your size",
        ),
        DropDownSection(
          title: "Add-Ins",
          items: ["Regular Ice", "Crushed Ice", "Shaved Ice"],
          hint: "Choose ice type",
        ),
        QuantitySection(itemName: "Splenda® packets", title: "Sweetener"),
        QuantitySection(itemName: "Pumpkin Spice", title: "Flavor"),
        DropDownSection(
          title: "Creamer",
          items: ["Oat milk", "Coconut milk", "Almond milk"],
          hint: "Choose creamer type",
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            CustomButton(title: "Add to Cart", onTap: () {}),
            const Spacer(),
            CustomButton(
              title: "Customize",
              onTap: () {},
              buttonColor: AppColors.freshMintColor,
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
