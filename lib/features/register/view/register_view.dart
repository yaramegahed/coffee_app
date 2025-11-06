import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../widget/register_body.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.registerBGColor,
        body: RegisterBody());
  }
}

