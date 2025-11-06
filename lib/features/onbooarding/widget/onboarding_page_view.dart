import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final List<Map<String, String>> pagesData;
  final Function(int) onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.controller,
    required this.pagesData,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: pagesData.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        final page = pagesData[index];
        return Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
          child: Column(
            children: [
              Image.asset(page["image"]!, height: 240),
              const SizedBox(height: 70),
              Text(
                page["title"]!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                page["description"]!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
