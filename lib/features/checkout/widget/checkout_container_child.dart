import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/widget/custom_button.dart';
import 'checkout_inner_container.dart';

class CheckoutContainerChild extends StatelessWidget {
  const CheckoutContainerChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Thank you!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.freshMintColor,
              fontSize: 24),
        ),
        CheckoutInnerContainer(),
        CustomButton(
          title: "Track Order",
          onTap: () {},
          width: double.infinity,
        )
      ],
    );
  }
}

