import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/features/home/widget/custom_home_body.dart';
import 'package:flutter/material.dart';
import '../widget/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

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
