import 'package:flutter/material.dart';

class CheckoutResetRow extends StatelessWidget {
  final String title;
  final String result;

  const CheckoutResetRow({
    super.key,
    required this.title,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Spacer(),
        Text(result)
      ],
    );
  }
}
