import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/features/order/widget/quantity_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/products_model.dart';
import '../../home/widget/custom_button.dart';
import 'drop_down_section.dart';

class ProductDetailsContent extends StatefulWidget {
  final Product product;

  const ProductDetailsContent({super.key, required this.product});

  @override
  State<ProductDetailsContent> createState() => _ProductDetailsContentState();
}

class _ProductDetailsContentState extends State<ProductDetailsContent> {
  String? cupSize;
  String? addIns;
  String? creamer;
  int sweetenerQty = 0;
  int flavorQty = 0;

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
          onChanged: (value) {
            cupSize = value;
          },
          title: "Cup Size",
          items: ["Large", "Small", "Med"],
          hint: "Choose your size",
        ),
        DropDownSection(
          onChanged: (value) {
            addIns = value;
          },
          title: "Add-Ins",
          items: ["Regular Ice", "Crushed Ice", "Shaved Ice"],
          hint: "Choose ice type",
        ),
        QuantitySection(
          itemName: "Splenda® packets",
          title: "Sweetener",
          onChanged: (value) {
            sweetenerQty = value;
          },
        ),
        QuantitySection(
          itemName: "Pumpkin Spice",
          title: "Flavor",
          onChanged: (value) {
            flavorQty = value;
          },
        ),
        DropDownSection(
          onChanged: (value) {
            creamer = value;
          },
          title: "Creamer",
          items: ["Oat milk", "Coconut milk", "Almond milk"],
          hint: "Choose creamer type",
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            CustomButton(
                title: "Add to Cart",
                onTap: () async {
                  String userId;

                  if (FirebaseAuth.instance.currentUser != null) {
                    userId = FirebaseAuth.instance.currentUser!.uid;
                  } else {
                    userId = "guest_${DateTime.now().millisecondsSinceEpoch}";
                  }
                  await FirebaseFirestore.instance.collection("orders").add({
                    "creamer": creamer,
                    "flavorQty": flavorQty,
                    "sweetenerQty": sweetenerQty,
                    "addIns": addIns,
                    "userId": userId,
                    "productId": widget.product.id,
                    "productName": widget.product.name,
                    "category": widget.product.category,
                  });
                  print("Order added to cart successfully!");
                  Navigator.of(context).pushNamed("/cart");
                }),
            const Spacer(),
            CustomButton(
              title: "Customize",
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/customize', arguments: widget.product);
              },
              buttonColor: AppColors.freshMintColor,
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
