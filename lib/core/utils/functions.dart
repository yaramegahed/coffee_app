import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

void showSnackBar(BuildContext context,
    {required bool success, String? message,successText,errorText}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: success ? AppColors.greenColor : Colors.red,
        content: Text(
          message ??
              (success
                  ? successText
                  : errorText),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
  );
}