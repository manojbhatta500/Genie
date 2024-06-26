part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailed extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginModel data;
  LoginSuccess({required this.data});
}

final class SignupLoading extends AuthState {}

final class SignupFailed extends AuthState {}

final class SignupSuccess extends AuthState {}
