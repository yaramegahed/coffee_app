import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: AppColors.shadowColor, blurRadius: 4)
            ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 48,
                  color: Colors.grey.shade700,
                ),
                SizedBox(height: 5,),
                Text(
                  "No item in your cart",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
