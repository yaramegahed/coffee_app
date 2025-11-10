import 'package:coffee_app/features/order/widget/product_details_container.dart';
import 'package:coffee_app/features/order/widget/product_details_content.dart';
import 'package:flutter/material.dart';

import '../../../core/models/products_model.dart';

class ProductDetailsBody extends StatelessWidget {
  final Product product;
  final String itemImage;
  final String itemName;

  const ProductDetailsBody(
      {super.key,  required this.itemImage,  required this.itemName, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),
          ProductDetailsContainer(
            itemImage: itemImage,
            itemName: itemName,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ProductDetailsContent(product: product,),
          ),
        ],
      ),
    );
  }
}
