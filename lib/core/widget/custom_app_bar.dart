import 'package:coffee_app/features/cart/cubit/order_cubit.dart';
import 'package:coffee_app/features/cart/cubit/order_state.dart';
import 'package:coffee_app/features/cart/view/cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackIcon;

  const CustomAppBar({
    super.key,
    this.showBackIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        int count = 0;
        if (state is OrdersSuccess) count = state.count;

        return AppBar(
          centerTitle: true,
          title: Image.asset(
            "assets/images/CoffeeShot logo.png",
            width: 30,
            height: 47,
          ),
          backgroundColor: AppColors.primaryColor,
          leading: showBackIcon
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Colors.grey.shade700,
                  ),
                )
              : SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CartView(),
                      ));
                },
                icon: Stack(clipBehavior: Clip.none, children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Positioned(
                    top: 0,
                    right: -8,
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: AppColors.freshMintColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          count.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ])),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
