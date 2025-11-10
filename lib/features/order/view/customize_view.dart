import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/models/products_model.dart';
import '../widget/customize_view_body.dart';

class CustomizeView extends StatelessWidget {
  final Product product;

  const CustomizeView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: const CustomAppBar(),
        body: CustomizeViewBody(product: product));
  }
}
