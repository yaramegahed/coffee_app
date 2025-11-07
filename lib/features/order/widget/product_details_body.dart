import 'package:coffee_app/features/order/widget/product_details_container.dart';
import 'package:coffee_app/features/order/widget/product_details_content.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 40),
          ProductDetailsContainer(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ProductDetailsContent(),
          ),
        ],
      ),
    );
  }
}




