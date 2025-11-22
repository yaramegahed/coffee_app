import 'package:coffee_app/features/cart/cubit/order_cubit.dart';
import 'package:coffee_app/features/cart/cubit/order_state.dart';
import 'package:coffee_app/features/cart/view/cart_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return BlocProvider(
      create: (context) => OrdersCubit()..listenOrdersCount(userId),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return AppBar(
            centerTitle: true,
            title: Image.asset(
              "assets/images/CoffeeShot logo.png",
              width: 30,
              height: 47,
            ),
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 40,
              ),
            ),
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
                    if (state is OrdersCountSuccess && state.count >= 0)
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
                            color: AppColors.greenColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              state.count.toString(),
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
