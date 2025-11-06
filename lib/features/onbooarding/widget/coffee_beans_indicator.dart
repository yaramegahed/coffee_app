import 'package:flutter/material.dart';

class CoffeeBeansIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;
  final AnimationController animationController;
  final Animation<double> rotationAnimation;

  const CoffeeBeansIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
    required this.animationController,
    required this.rotationAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(itemCount, (index) {
        bool isActive = index == currentPage;
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final rotation = isActive ? rotationAnimation.value : 0.0;
            return Transform.rotate(
              angle: rotation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Image.asset(
                  isActive
                      ? "assets/images/Group 90.png"
                      : "assets/images/Group 91.png",
                  height: 20,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
