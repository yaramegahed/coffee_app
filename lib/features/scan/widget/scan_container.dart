import 'package:coffee_app/features/scan/widget/reward_row.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'icon_column.dart';

class ScanContainer extends StatelessWidget {
  const ScanContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black87.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          RewardsRow(),
          const SizedBox(height: 20),
          const Text(
            "\$52.17",
            style: TextStyle(
              fontSize: 42,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          QrImageView(
            data: "www.linkedin.com/in/yara-megahed",
            size: 190,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              IconColumn(text: 'Add Funds', icon: Icons.monetization_on_outlined,),
              IconColumn(text: 'Manage', icon: Icons.settings_outlined,),
            ],
          ),
        ],
      ),
    );
  }
}
