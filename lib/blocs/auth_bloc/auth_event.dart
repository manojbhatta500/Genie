part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

final class SignupEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  SignupEvent(
      {required this.email, required this.password, required this.username});
}
