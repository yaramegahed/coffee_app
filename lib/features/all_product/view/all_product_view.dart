import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:coffee_app/features/all_product/widget/all_product_body.dart';
import 'package:flutter/material.dart';

import '../../../core/models/products_model.dart';

class AllProductView extends StatelessWidget {
  final List<Product> products;
  const AllProductView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(),
      body: AllProductBody(products: products,),
    );
  }
}
