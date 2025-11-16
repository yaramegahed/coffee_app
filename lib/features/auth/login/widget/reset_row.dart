import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ResetRow extends StatelessWidget {
  final void Function() onPressed;
  const ResetRow({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Forgot password?",
          style: TextStyle(
              color: AppColors.freshMintColor,
              fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              "Reset",
              style: TextStyle(color: AppColors.brownButtonColor),
            )),
      ],
    );
  }
}
