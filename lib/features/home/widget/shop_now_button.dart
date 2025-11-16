import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'home_layout.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeLayout(
                    initialIndex: 2,
                  ),
                ));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 35,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.brownButtonColor,
            ),
            child: Center(
              child: Text(
                "Shop now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
