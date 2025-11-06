import 'package:coffee_app/features/home/widget/custom_button.dart';
import 'package:coffee_app/features/login/view/login_view.dart';
import 'package:flutter/material.dart';

import 'coffee_beans_indicator.dart';

class PageControlRow extends StatelessWidget {
  final PageController pageController;
  final List<Map<String, String>> pagesData;
  final int currentPage;
  final AnimationController animationController;
  final Animation<double> rotationAnimation;

  const PageControlRow({
    super.key,
    required this.pageController,
    required this.pagesData,
    required this.currentPage,
    required this.animationController,
    required this.rotationAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == pagesData.length - 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          CoffeeBeansIndicator(
            itemCount: pagesData.length,
            currentPage: currentPage,
            animationController: animationController,
            rotationAnimation: rotationAnimation,
          ),
          const Spacer(),
          CustomButton(
            title: isLastPage ? "Start" : "Next",
            onTap: () {
              if (!isLastPage) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
