import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User user;
  final String name;
  final String email;

  AuthLoggedIn( {required this.user,required this.name, required this.email});
}

class AuthLoggedOut extends AuthState {}
class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
