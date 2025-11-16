import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/features/auth/login/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        emit(AuthLoggedOut());
      } else {
        await getUserName(user);
      }
    });
  }

  Future<void> getUserName(User user) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      final data = doc.data() ?? {};
      emit(AuthLoggedIn(
        user: user,
        name: data["name"] ?? "name",
        email: data["email"] ?? "email",
      ));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => LoginView(),
          ));
    }
  }
}
