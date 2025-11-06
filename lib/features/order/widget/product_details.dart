import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:coffee_app/features/home/widget/custom_button.dart';
import 'package:coffee_app/features/order/widget/quantity_selector.dart';
import 'package:flutter/material.dart';

import 'custom_drop_down_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.freshMintColor,
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Mixed Black Coffee1.png",
                    height: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Hot Coffee",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's included",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cup Size",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: CustomDropDownButton(
                      items: ["Large", "Small", "Med"],
                      hint: 'choose your size',
                      onChanged: (String) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add-Ins",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: CustomDropDownButton(
                      items: ["Regular Ice", "Crushed Ice", "Shaved Ice"],
                      hint: 'Choose ice type',
                      onChanged: (String) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sweetener",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuantitySelector(itemName: "Splenda® packets"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Flavor",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuantitySelector(itemName: "Pumkin Spice"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Creamer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: CustomDropDownButton(
                      items: ["Regular Ice", "Crushed Ice", "Shaved Ice"],
                      hint: 'Choose ice type',
                      onChanged: (String) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomButton(title: "Add to Cart", onTap: () {}),
                      Spacer(),
                      CustomButton(
                        title: "Customize",
                        onTap: () {},
                        buttonColor: AppColors.freshMintColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
