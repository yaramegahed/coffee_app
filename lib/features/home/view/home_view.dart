import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: CustomAppBar(),
        body: CustomHomeBody(),
      ),
    );
  }
}


