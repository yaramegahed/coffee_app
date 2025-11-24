import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/core/widget/custom_app_bar.dart';
import 'package:coffee_app/features/cart/widget/cart_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user != null
        ? user.uid
        : "guest_123456";

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(showBackIcon: true,),
      body:CartBody(userId: userId,),
    );
  }
}
