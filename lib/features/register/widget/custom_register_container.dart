import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'custom_register_container_child.dart';

class CustomRegisterContainer extends StatelessWidget {
  const CustomRegisterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 4,
                offset: Offset(0, -2))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          )),
      child: CustomRegisterContainerChild(),
    );
  }
}
