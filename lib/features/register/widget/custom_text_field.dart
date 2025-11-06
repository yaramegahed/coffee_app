import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField({
    super.key,
    this.onChanged,
    this.controller,
    required this.hintText,
    this.isPassword = false, this.validator,
  });

  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 2)
        ],
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.isPassword ? obscureText : false,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: "Poppins"),
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword ? IconButton(onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
                icon: Icon(
                    obscureText ? CupertinoIcons.eye_slash : CupertinoIcons
                        .eye)) : null,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
          )),
    );
  }
}
