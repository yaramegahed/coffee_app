import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/validator/app_validators.dart';
import '../../../home/widget/custom_button.dart';
import '../../register/view/register_view.dart';
import '../../register/widget/custom_text_field.dart';
import '../../register/widget/text_form_field_title.dart';

class CustomLoginContainerChild extends StatefulWidget {
  const CustomLoginContainerChild({super.key});

  @override
  State<CustomLoginContainerChild> createState() =>
      _CustomLoginContainerChildState();
}

class _CustomLoginContainerChildState extends State<CustomLoginContainerChild> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sign in",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                color: AppColors.brownButtonColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "It’s coffee time! Login and lets get all the coffee in the world! Or at least iced coffee. ",
            style: TextStyle(fontSize: 16, color: AppColors.brownButtonColor),
          ),
          const TextFormFieldTitle(
            title: "Email or phone number",
          ),
          CustomFormTextField(
            validator: (value) => AppValidators.emailOrPhone(value),
            hintText: 'Type your email or phone number',
          ),
          const TextFormFieldTitle(
            title: "Password",
          ),
          CustomFormTextField(
            validator: (value) => AppValidators.password(value),
            isPassword: true,
            hintText: 'Type your password',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            hasShadow: true,
            title: "LOGIN",
            onTap: () {},
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: AppColors.freshMintColor),
                  )),
              Text(
                "Reset",
                style: TextStyle(
                    color: AppColors.brownButtonColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                "Don’t have an account?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          CustomButton(
            hasShadow: true,
            title: "CREATE NEW ACCOUNT",
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterView(),
                  ));
            },
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
