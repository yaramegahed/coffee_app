import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:coffee_app/features/home/widget/custom_button.dart';
import 'package:coffee_app/features/order/widget/drop_down_section.dart';
import 'package:coffee_app/features/order/widget/product_details_container.dart';
import 'package:flutter/material.dart';

import '../widget/customize_container_content.dart';
import '../widget/done_customize_row.dart';
import '../widget/quantity_section.dart';

class CustomizeView extends StatelessWidget {
  const CustomizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          const ProductDetailsContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Column(
              children: [
                DoneCustomizingRow(),
                CustomizeContainerContent(),
                CustomizeContainerContent(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flavors",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      QuantitySection(
                          itemName: "Splenda® packets", title: "Flavor"),
                      DropDownSection(
                        title: "Flavor",
                        items: ["Add syrup", "Small", "Med"],
                        hint: "Choose your Flavor",
                      ),
                    ],
                  ),
                ),
                CustomizeContainerContent(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flavors",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      QuantitySection(
                          itemName: "Splenda® packets", title: "Sweetener"),
                      DropDownSection(
                        title: "Creamer",
                        items: ["Oat milk", "Coconut milk", "Almond milk"],
                        hint: "Choose creamer type",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: "Done Customize",
                  onTap: () {},
                  width: double.infinity,
                  buttonColor: AppColors.freshMintColor,
                )
              ],
            ),
          ),
        ])));
  }
}

