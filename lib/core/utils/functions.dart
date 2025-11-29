import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/features/order/widget/order_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/cubit/auth_cubit.dart';
import '../constants/app_colors.dart';

void showSnackBar(BuildContext context,
    {required bool success, String? message, successText, errorText}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: success ? AppColors.greenColor : Colors.red,
        content: Text(
          message ?? (success ? successText : errorText),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
  );
}

void showSignOutDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (ctx) {
      return CupertinoAlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you sure you want to sign out?"),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            isDefaultAction: true,
            child: const Text("Cancel"),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<AuthCubit>().logout(context: context);
            },
            isDestructiveAction: true,
            child: const Text(
              "Sign Out",
              style: TextStyle(color: CupertinoColors.systemRed),
            ),
          ),
        ],
      );
    },
  );
}

Future<Map<String, dynamic>> getOptions(String category) async {
  final doc = await FirebaseFirestore.instance
      .collection("productOptions")
      .doc(category)
      .get();
  return doc.data() ?? {};
}

Future<Map<String, dynamic>> getCustomizeOptions(String category) async {
  final doc = await FirebaseFirestore.instance
      .collection('customizeOptions')
      .doc(category)
      .get();

  return doc.data() ?? {};
}

Future<Object?> buildShowGeneralDialog(
    BuildContext context, void Function()? onPressed) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 250),
    pageBuilder: (context, animation1, animation2) {
      return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Material(
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 350,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.greenColor, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: AppColors.greenColor,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Added to cart successfully!",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: onPressed,
                            child: Text(
                              "Continue",
                              style: TextStyle(color: AppColors.greenColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).pushNamed("/cart");
                            },
                            child: Text(
                              "Cart",
                              style:
                                  TextStyle(color: AppColors.brownButtonColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
