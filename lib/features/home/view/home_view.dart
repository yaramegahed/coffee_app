import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/features/home/widget/custom_home_body.dart';
import 'package:flutter/material.dart';
import '../../scan/view/scan_view.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    CustomHomeBody(),
    ScanView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: CustomAppBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: HomeLayout(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
