import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color buttonColor;
  final Color textColor;
  final double width;
  final bool hasShadow;

  const CustomButton({
    super.key,
    required this.title,
    this.buttonColor = AppColors.brownButtonColor,
    this.textColor = AppColors.primaryColor,
    required this.onTap,
    this.width = 135,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    spreadRadius: 2,
                      color: AppColors.shadowColor,
                      blurRadius: 4,
                      offset: Offset(4, 4))
                ]
              : [],
            color: buttonColor, borderRadius: BorderRadius.circular(22)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
