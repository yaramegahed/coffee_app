import 'package:flutter/material.dart';
import '../../../core/widget/skip_text.dart';
import 'custom_register_container.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SkipText(),
          Image.asset(
            "assets/images/CoffeeShot logo.png",
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          CustomRegisterContainer()
        ],
      ),
    );
  }
}



