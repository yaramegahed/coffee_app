import 'package:coffee_app/features/home/widget/home_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      if (!mounted) return;
      await Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeLayout(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset("assets/images/Splash.png", fit: BoxFit.cover),
      ),
    );
  }
}
