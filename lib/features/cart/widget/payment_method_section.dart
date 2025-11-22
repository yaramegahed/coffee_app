import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Method",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                CupertinoIcons.creditcard,
                color: Colors.grey.shade700,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text("Apple pay"),
          const Divider(height: 30),
        ],
      ),
    );
  }
}
