import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/models/products_model.dart';
import '../widget/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(showBackIcon: true,),
      body: ProductDetailsBody(
        itemImage: product.imageUrl,
        itemName: product.name ?? "drink",
        product: product,
      ),
    );
  }
}
