part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSucess extends AuthState {
  final String uid;

  AuthSucess({required this.uid});
}

final class AuthFaliure extends AuthState {
  final String error;
  AuthFaliure(this.error);
}

final class AuthLoading extends AuthState {}