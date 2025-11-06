import 'package:coffee_app/core/widget/custom_auth_container.dart';
import 'package:coffee_app/features/register/widget/custom_register_container_child.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/skip_text.dart';

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
          CustomAuthContainer(child: CustomRegisterContainerChild()),
        ],
      ),
    );
  }
}
