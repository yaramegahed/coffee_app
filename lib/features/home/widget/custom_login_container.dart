import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'custom_login_button.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 4,
                offset: Offset(0, 4))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4))),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          CustomLoginButton(),
          SizedBox(height: 23,)
        ],
      ),
    );
  }
}
