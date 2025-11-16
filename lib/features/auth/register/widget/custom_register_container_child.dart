import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/core/utils/styles.dart';
import 'package:coffee_app/core/validator/app_validators.dart';
import 'package:coffee_app/features/auth/register/widget/text_form_field_title.dart';
import 'package:coffee_app/features/home/widget/home_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/functions.dart';
import '../../../home/widget/custom_button.dart';
import '../../login/view/login_view.dart';
import 'custom_text_field.dart';

class CustomRegisterContainerChild extends StatefulWidget {
  const CustomRegisterContainerChild({
    super.key,
  });

  @override
  State<CustomRegisterContainerChild> createState() =>
      _CustomRegisterContainerChildState();
}

class _CustomRegisterContainerChildState
    extends State<CustomRegisterContainerChild> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: Styles.textStyle28b,
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
            controller: userNameController,
            validator: (value) => AppValidators.userName(value),
            hintText: 'Enter username',
          ),
          TextFormFieldTitle(
            title: "Email or phone number",
          ),
          CustomFormTextField(
            controller: emailController,
            onChanged: (value) {},
            validator: (value) => AppValidators.emailOrPhone(value),
            hintText: 'Type your email or phone number',
          ),
          TextFormFieldTitle(
            title: "Password",
          ),
          CustomFormTextField(
            controller: passwordController,
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
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  String uid = user.user!.uid;
                   users.doc(uid).set({
                    "name": userNameController.text.trim(),
                    "email": emailController.text.trim(),
                  });
                  if (context.mounted) {
                    showSnackBar(context,
                        success: true,
                        successText: "Account created successfully!");
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
