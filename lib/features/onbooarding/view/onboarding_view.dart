import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/skip_text.dart';
import 'package:flutter/material.dart';
import '../widget/onboarding_page_view.dart';
import '../widget/page_control_row.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  final List<Map<String, String>> _pagesData = [
    {
      "image": "assets/images/onboarding images.png",
      "title": "Choose and customize your drinks with simplicity",
      "description":
      "You want your drink and you want it your way so be bold and customize the way that makes you the happiest!",
    },
    {
      "image": "assets/images/onboarding images2.png",
      "title": "No time to waste when you need your coffee",
      "description":
      "We’ve crafted a quick and easy way for you to order your favorite coffee or treats that's fast!"
    },
    {
      "image": "assets/images/onboarding images3.png",
      "title": "Who doesn’t love rewards? We LOVE rewards!",
      "description":
      "If you’re like us you love getting freebies and rewards! That’s why we have the best reward program in the coffee game!"
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotationAnimation =
        Tween<double>(begin: 0, end: 0.3).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.registerBGColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SkipText(),
          Expanded(
            child: OnboardingPageView(
              controller: _pageController,
              pagesData: _pagesData,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
                _animationController.forward(from: 0.0);
              },
            ),
          ),
          PageControlRow(
            pageController: _pageController,
            pagesData: _pagesData,
            currentPage: _currentPage,
            animationController: _animationController,
            rotationAnimation: _rotationAnimation,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
