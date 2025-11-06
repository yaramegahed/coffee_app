import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomAuthContainer extends StatelessWidget {
  final Widget child;

  const CustomAuthContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: const Offset(0, -2),
          )
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      child: child,
    );
  }
}
