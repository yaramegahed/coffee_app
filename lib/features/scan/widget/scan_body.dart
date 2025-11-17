import 'package:coffee_app/features/scan/widget/scan_container.dart';
import 'package:flutter/material.dart';

class ScanBody extends StatelessWidget {
  const ScanBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
          ),
          ScanContainer(),
        ],
      ),
    );
  }
}



