import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../cart/cubit/order_cubit.dart';
import '../../home/widget/custom_button.dart';
import 'checkout_inner_container.dart';

class CheckoutContainerChild extends StatelessWidget {
  const CheckoutContainerChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user != null ? user.uid : "guest_123456";
    return Column(
      children: [
        Text(
          "Thank you!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.freshMintColor,
              fontSize: 24),
        ),
        CheckoutInnerContainer(),
        CustomButton(
          title: "Track Order",
          onTap: () {},
          width: double.infinity,
        ),
        SizedBox(
          height: 10,
        ),
        CustomButton(
          buttonColor: AppColors.freshMintColor,
          title: "Done",
          onTap: () {
            context.read<OrdersCubit>().clearOrders();
            context.read<OrdersCubit>().clearOrdersBackend(userId);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          width: double.infinity,
        ),
      ],
    );
  }
}
