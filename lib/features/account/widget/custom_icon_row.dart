import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class CustomIconRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomIconRow({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        children: [
          Text(
            text,
            style: Styles.textStyle20400G,
          ),
          Spacer(),
          Icon(
            icon,
            color: Colors.grey.shade700,
          )
        ],
      ),
    );
  }
}
