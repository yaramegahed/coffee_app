import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/login/view/login_view.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ));
      },
      child: Container(
        height: 60,
        width: 320,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.freshMintColor, width: 2)),
        child: Center(
            child: Text(
          "LOGIN",
          style: TextStyle(color: AppColors.freshMintColor),
        )),
      ),
    );
  }
}
