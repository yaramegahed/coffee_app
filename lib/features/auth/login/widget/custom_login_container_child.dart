import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/validator/app_validators.dart';
import '../../../home/widget/custom_button.dart';
import '../../../home/widget/home_layout.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            controller: emailController,
            validator: (value) => AppValidators.emailOrPhone(value),
            hintText: 'Type your email or phone number',
          ),
          const TextFormFieldTitle(
            title: "Password",
          ),
          CustomFormTextField(
            controller: passwordController,
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
            onTap: () async{
              if (_formKey.currentState!.validate()) {
                try {
                  UserCredential user = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (context.mounted) {
                    showSnackBar(context, success: true,successText: "Account login successfully!");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeLayout(),
                        ));
                  }
                } on FirebaseAuthException catch (e) {
                  if (context.mounted) {
                    showSnackBar(context, message: e.message, success: false);
                  }
                }
              }
            },
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
