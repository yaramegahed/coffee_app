import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/features/login/widget/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.registerBGColor,
      body: LoginBody(),
    );
  }
}
