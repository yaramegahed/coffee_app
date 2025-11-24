import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/core/utils/functions.dart';
import 'package:coffee_app/features/order/widget/product_details_container.dart';
import 'package:coffee_app/features/order/widget/quantity_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/products_model.dart';
import '../../cart/cubit/order_cubit.dart';
import '../../home/widget/custom_button.dart';
import 'customize_container_content.dart';
import 'done_customize_row.dart';
import 'drop_down_section.dart';

class CustomizeViewBody extends StatefulWidget {
  const CustomizeViewBody({
    super.key,
    required this.product,
    required this.orderId,
  });

  final Product product;
  final String orderId;

  @override
  State<CustomizeViewBody> createState() => _CustomizeViewBodyState();
}

class _CustomizeViewBodyState extends State<CustomizeViewBody> {
  Map<String, dynamic> selectedValues = {};
  Map<String, int> quantities = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCustomizeOptions(
          widget.product.category?.toLowerCase() ?? "ice cream"),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.brownButtonColor),
          );
        }

        final options = snapshot.data as Map<String, dynamic>;

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              ProductDetailsContainer(
                itemImage: widget.product.imageUrl,
                itemName: widget.product.name ?? "drink",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: Column(
                  children: [
                    DoneCustomizingRow(),
                    ..._buildDynamicCustomizeFields(options),
                    const SizedBox(height: 10),
                    CustomButton(
                      title: "Done Customize",
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('orders')
                            .doc(widget.orderId)
                            .update({
                          ...selectedValues,
                          ...quantities,
                          'customized': true,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        final String userId =
                            FirebaseAuth.instance.currentUser?.uid ?? "";
                        if (context.mounted) {
                          context
                              .read<OrdersCubit>()
                              .fetchOrders(userId)
                              .then((_) {
                            Navigator.of(context).pushReplacementNamed("/cart");
                          });
                        }
                      },
                      width: double.infinity,
                      buttonColor: AppColors.freshMintColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildDynamicCustomizeFields(Map<String, dynamic> options) {
    List<Widget> fields = [];

    options.forEach((key, value) {
      if (value is List) {
        // Dropdown section
        fields.add(
          CustomizeContainerContent(
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key[0].toUpperCase() + key.substring(1),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                DropDownSection(
                  title: key,
                  items: List<String>.from(value),
                  hint: "Choose $key",
                  onChanged: (val) {
                    selectedValues[key] = val;
                  },
                ),
              ],
            ),
          ),
        );
      } else if (value is Map && value["type"] == "quantity") {
        // Quantity Section
        fields.add(
          CustomizeContainerContent(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value["title"] ?? key,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                QuantitySection(
                  itemName: value["itemName"] ?? "",
                  title: value["title"] ?? key,
                  onChanged: (qty) {
                    quantities[key] = qty;
                  },
                ),
              ],
            ),
          ),
        );
      }
    });

    return fields;
  }
}
