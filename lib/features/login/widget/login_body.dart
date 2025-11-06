import 'package:coffee_app/core/widget/custom_auth_container.dart';
import 'package:coffee_app/features/login/widget/custom_login_container_child.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/skip_text.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SkipText(),
                  Image.asset(
                    "assets/images/CoffeeShot logo.png",
                    height: 90,
                  ),
                  const SizedBox(height: 10),
                  const Expanded(
                    child: CustomAuthContainer(
                      child: CustomLoginContainerChild(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
