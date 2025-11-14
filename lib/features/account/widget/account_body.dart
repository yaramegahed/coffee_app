import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/utils/styles.dart';
import 'package:coffee_app/features/account/widget/sign_out_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_icon_row.dart';
import 'custom_switch_row.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Account",
              style: Styles.textStyle30b,
            ),
            Text(
              "Welcome Vasken!",
              style: Styles.textStyle18400,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: Styles.textStyle20b,
                  ),
                  CustomIconRow(
                    text: 'Personal Info',
                    icon: CupertinoIcons.info,
                  ),
                  CustomIconRow(
                    text: 'Cards & Payments',
                    icon: CupertinoIcons.creditcard_fill,
                  ),
                  CustomIconRow(
                    text: 'Transaction History',
                    icon: Icons.history,
                  ),
                  CustomIconRow(
                    text: 'Privacy & Data',
                    icon: CupertinoIcons.hand_raised,
                  ),
                  CustomIconRow(
                    text: 'Account ID',
                    icon: Icons.account_box_outlined,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Security",
                    style: Styles.textStyle20b,
                  ),
                  CustomSwitchRow(
                    text: '2- factor authentication',
                  ),
                  CustomSwitchRow(
                    text: 'Face ID',
                  ),
                  CustomSwitchRow(
                    text: 'Passcode Lock',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Notification Preferences",
                    style: Styles.textStyle20b,
                  ),
                  CustomSwitchRow(text: 'Inbox messages'),
                  CustomSwitchRow(
                    text: 'Tipping,Receipts&Orders',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Help & Policies",
                    style: Styles.textStyle20b,
                  ),
                  CustomIconRow(
                    text: 'Help',
                    icon: Icons.help_outline,
                  ),
                  CustomIconRow(
                    text: 'Application Terms',
                    icon: Icons.file_copy_outlined,
                  ),
                  CustomIconRow(
                    text: 'Privacy Notice',
                    icon: Icons.lock_outline_rounded,
                  ),
                  CustomIconRow(
                    text: 'Delete Account',
                    icon: CupertinoIcons.forward,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "DO NOT SHARE MY PERSONAL INFORMATION",
                    style: TextStyle(fontSize: 14, color: AppColors.greenColor),
                  ),
                  SignOutButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
