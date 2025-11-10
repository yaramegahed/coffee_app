import 'package:flutter/material.dart';

import '../models/products_model.dart';
import 'custom_menu_items.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.products,
    required this.itemCount, this.onTap,
  });

  final List<Product> products;
  final int itemCount;
  final void Function(Product)? onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return CustomMenuItems(
          onTap: (){
            if (onTap != null) onTap!(product);
          },
          itemTitle: product.name ?? "",
          itemImage: product.imageUrl,
        );
      },
    );
  }
}
