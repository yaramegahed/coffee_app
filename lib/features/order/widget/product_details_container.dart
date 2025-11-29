import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String itemImage;
  final String itemName;

  const ProductDetailsContainer({
    super.key,
    required this.itemImage,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.freshMintColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: itemImage,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              itemName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
