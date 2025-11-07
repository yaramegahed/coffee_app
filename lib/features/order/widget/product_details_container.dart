import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({
    super.key,
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
              Image.asset(
                "assets/images/Mixed Black Coffee1.png",
                height: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Hot Coffee",
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
