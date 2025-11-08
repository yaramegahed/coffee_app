import 'package:coffee_app/core/validator/app_validators.dart';
import 'package:coffee_app/features/auth/register/widget/text_form_field_title.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/widget/custom_button.dart';
import '../../login/view/login_view.dart';
import 'custom_text_field.dart';

class CustomRegisterContainerChild extends StatefulWidget {
  const CustomRegisterContainerChild({
    super.key,
  });

  @override
  State<CustomRegisterContainerChild> createState() => _CustomRegisterContainerChildState();
}

class _CustomRegisterContainerChildState extends State<CustomRegisterContainerChild> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                color: AppColors.brownButtonColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "We are so excited you’re ready to become apart of our coffee network! don’t forget  check out your perks!",
            style: TextStyle(fontSize: 16, color: AppColors.brownButtonColor),
          ),
          TextFormFieldTitle(
            title: "Username",
          ),
          CustomFormTextField(
            validator: (value) => AppValidators.userName(value),
            hintText: 'Enter username',
          ),
          TextFormFieldTitle(
            title: "Email or phone number",
          ),
          CustomFormTextField(
            validator: (value) => AppValidators.emailOrPhone(value),
            hintText: 'Type your email or phone number',
          ),
          TextFormFieldTitle(
            title: "Password",
          ),
          CustomFormTextField(
            validator: (value) => AppValidators.password(value),
            isPassword: true,
            hintText: 'Type your password',
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            hasShadow: true,
            title: "REGISTER",
            onTap: () {},
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                "Already have an account?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          CustomButton(
            hasShadow: true,
            title: "SIGN IN",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ));
            },
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
