import 'package:flutter/material.dart';

class IconColumn extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconColumn({
    super.key, required this.text, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            color: Colors.white, size: 26),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
