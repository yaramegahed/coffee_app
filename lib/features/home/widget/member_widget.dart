import 'package:coffee_app/features/home/widget/shop_now_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/styles.dart';

class MemberWidget extends StatelessWidget {
  final String name;

  const MemberWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Good Morning! $name", style: Styles.textStyle20b),
        Text("Lets get this Coffee ☕️ ", style: Styles.textStyle20400),
        const SizedBox(height: 18),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.freshMintColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BONUS REWARDS",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Coffee Delivered to your house",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order 2 bags of coffee and get bonus stars!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order any of our coffee and get an additional 30 Stars! Now that’s how you get free coffee!",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  ShopNowButton()
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

