import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomMenuCategorizedRow extends StatelessWidget {
  final String menuTitle;
  const CustomMenuCategorizedRow({
    super.key, required this.menuTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Text(
            menuTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: TextStyle(
                    color: AppColors.freshMintColor, fontSize: 20),
              ))
        ],
      ),
    );
  }
}
