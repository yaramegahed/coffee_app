import 'package:coffee_app/features/register/view/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'custom_button.dart';
import 'custom_login_container.dart';

class CustomHomeOrderContainer extends StatelessWidget {
  const CustomHomeOrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.freshMintColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4), topLeft: Radius.circular(4))),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                "Join the Rewards program to enjoy free beverages, special offers and more!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomButton(
                    title: 'JOIN NOW',
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoModalPopupRoute(
                            builder: (context) => RegisterView(),
                          ));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomButton(
                    title: 'GUEST ORDER',
                    buttonColor: AppColors.beigeButtonColor,
                    textColor: AppColors.brownButtonColor,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomLoginContainer()
      ],
    );
  }
}
