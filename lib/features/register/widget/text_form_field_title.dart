import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class TextFormFieldTitle extends StatelessWidget {
  final String title;
  const TextFormFieldTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,bottom: 10),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.freshMintColor,
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
