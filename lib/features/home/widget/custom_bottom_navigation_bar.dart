import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class HomeLayout extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;
  const HomeLayout({
    super.key, required this.onTap, required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.blueColor,
        unselectedItemColor: AppColors.greyColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'Scan / Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Rewards',
          ),
        ],
      ),
    );
  }
}
