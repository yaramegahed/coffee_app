import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widget/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(),
      body: ProductDetailsBody(),
    );
  }
}


