import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 35,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: AppColors.greenColor)),
      child: Center(
        child: Text(
          "Sign Out",
          style: TextStyle(
              color: AppColors.greenColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
