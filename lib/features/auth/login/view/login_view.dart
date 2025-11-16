import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.registerBGColor,
      body: LoginBody(),
    );
  }
}
