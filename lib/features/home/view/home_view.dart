import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/features/home/cubit/home_cubit.dart';
import 'package:coffee_app/features/home/widget/custom_home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getProducts(),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: CustomAppBar(),
          body: CustomHomeBody(),
        ),
      ),
    );
  }
}
