import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String itemImage;
  final String itemName;
  const ProductDetailsContainer({
    super.key,  required this.itemImage,  required this.itemName,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  itemImage??"",
                  height: 100,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                itemName??"",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
