import 'package:coffee_app/features/order/widget/product_details_container.dart';
import 'package:coffee_app/features/order/widget/quantity_section.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/products_model.dart';
import '../../home/widget/custom_button.dart';
import 'customize_container_content.dart';
import 'done_customize_row.dart';
import 'drop_down_section.dart';

class CustomizeViewBody extends StatelessWidget {
  const CustomizeViewBody({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          ProductDetailsContainer(
            itemImage: product.imageUrl,
            itemName: product.name ?? "drink",
          ),
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
        ]));
  }
}
