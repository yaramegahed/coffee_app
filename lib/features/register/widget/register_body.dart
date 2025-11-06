import 'package:flutter/material.dart';
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
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Skip",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
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


