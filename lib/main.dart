import 'package:coffee_app/features/home/widget/home_layout.dart';
import 'package:coffee_app/features/order/view/order_view.dart';
import 'package:coffee_app/features/register/view/register_view.dart';
import 'package:coffee_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeLayout(),
    );
  }
}
