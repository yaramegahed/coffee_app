import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  const CustomButton({
    super.key, required this.title, required this.buttonColor, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: 135,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(22)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
