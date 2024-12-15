part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLogInRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLogInRequested({required this.email, required this.password});
}

final class AuthLogOutRequested extends AuthEvent {}  