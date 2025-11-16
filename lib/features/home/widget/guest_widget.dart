import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import 'custom_home_order_container.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Good Morning!", style: Styles.textStyle20b),
        Text("Login and get free ☕️", style: Styles.textStyle20400),
        const SizedBox(height: 18),
        const CustomHomeOrderContainer(),
      ],
    );
  }
}
