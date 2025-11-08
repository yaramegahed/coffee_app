import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomMenuCategorizedRow extends StatelessWidget {
  final String menuTitle;
  final void Function()? onPressed;

  const CustomMenuCategorizedRow({
    super.key,
    required this.menuTitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(
            menuTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Spacer(),
          TextButton(
              onPressed: onPressed,
              child: Text(
                "See all",
                style: TextStyle(color: AppColors.freshMintColor, fontSize: 20),
              ))
        ],
      ),
    );
  }
}
