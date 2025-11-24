import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/core/utils/functions.dart';
import 'package:coffee_app/features/order/widget/quantity_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
  final Map<String, dynamic> selectedValues = {};
  final Map<String, int> quantities = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getOptions(widget.product.category?.toLowerCase() ?? "ice cream"),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Failed to load options"));
        }
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.brownButtonColor,
          ));
        }

        final options = snapshot.data as Map<String, dynamic>;

        final Map<String, List<Map<String, String>>> categoryFields = {
          "coffee": [
            {"type": "dropdown", "key": "cupSizes"},
            {"type": "dropdown", "key": "addIns"},
            {"type": "quantity", "key": "sweetenerOptions"},
            {"type": "quantity", "key": "flavorOptions"},
            {"type": "dropdown", "key": "creamers"},
          ],
          "cookie": [
            {"type": "dropdown", "key": "flavors"},
            {"type": "dropdown", "key": "sizes"},
            {"type": "dropdown", "key": "toppings"},
          ],
        };

        final Map<String, String> fieldTitles = {
          "cupSizes": "Cup Size",
          "addIns": "Add-Ins",
          "creamers": "Creamer",
          "sweetenerOptions": "Sweetener",
          "flavorOptions": "Flavor",
          "flavors": "Flavor",
          "sizes": "Size",
          "toppings": "Toppings",
        };

        final fields =
            categoryFields[widget.product.category?.toLowerCase()] ?? [];

        List<Widget> dynamicFields = [];

        for (var field in fields) {
          final key = field["key"]!;
          final type = field["type"]!;
          final title = fieldTitles[key] ?? key;

          if (!options.containsKey(key)) continue;

          if (type == "dropdown") {
            dynamicFields.add(
              DropDownSection(
                onChanged: (value) {
                  setState(() {
                    selectedValues[key] = value;
                  });
                },
                title: title,
                items: List<String>.from(options[key]),
                hint: "Choose $title",
              ),
            );
          } else if (type == "quantity") {
            dynamicFields.add(
              QuantitySection(
                itemName: List<String>.from(options[key]).first,
                title: title,
                onChanged: (value) {
                  setState(() {
                    quantities[key] = value;
                  });
                },
              ),
            );
          }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customize Your ${widget.product.name}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...dynamicFields,
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
                    final orderRef = await FirebaseFirestore.instance
                        .collection("orders")
                        .add({
                      "userId": userId,
                      "productId": widget.product.id,
                      "productName": widget.product.name,
                      "category": widget.product.category,
                      "price": widget.product.price,
                      ...selectedValues,
                      ...quantities,
                    });
                    if (kDebugMode) {
                      print("Order added to cart successfully!");
                    }
                    if (context.mounted) {
                      Navigator.of(context).pushNamed("/cart");
                    }
                  },
                ),
                const Spacer(),
                CustomButton(
                  title: "Customize",
                  onTap: () async {
                    String userId = FirebaseAuth.instance.currentUser?.uid ??
                        "guest_${DateTime.now().millisecondsSinceEpoch}";

                    final orderRef = await FirebaseFirestore.instance
                        .collection("orders")
                        .add({
                      "userId": userId,
                      "productId": widget.product.id,
                      "productName": widget.product.name,
                      "category": widget.product.category,
                      "price": widget.product.price,
                      ...selectedValues,
                      ...quantities,
                      "createdAt": FieldValue.serverTimestamp(),
                    });

                    final orderId = orderRef.id;
                    if (context.mounted) {
                      Navigator.of(context).pushNamed('/customize', arguments: {
                        'product': widget.product,
                        'orderId': orderId,
                      });
                    }
                  },
                  buttonColor: AppColors.freshMintColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
