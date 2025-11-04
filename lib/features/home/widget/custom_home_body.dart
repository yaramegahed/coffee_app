import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_home_order_container.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          Text(
            "Good Morning!",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Login and get free ☕️ ",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 18,
          ),
          CustomHomeOrderContainer(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Drinks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: AppColors.freshMintColor, fontSize: 20),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
