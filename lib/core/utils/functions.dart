import 'package:cloud_firestore/cloud_firestore.dart';
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
