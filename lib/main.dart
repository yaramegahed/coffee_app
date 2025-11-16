import 'package:coffee_app/core/bloc_observer/simple_bloc_observer.dart';
import 'package:coffee_app/core/cubit/products_cubit.dart';
import 'package:coffee_app/features/auth/cubit/auth_cubit.dart';
import 'package:coffee_app/features/splash/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProductsCubit()
            ..getProducts(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
