import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogInRequested>(_onAuthRequest);

    on<AuthLogOutRequested>(_onAUthLogoutRequest);
  }

  void _onAuthRequest(AuthLogInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      if (password.length < 8) {
        emit(AuthFaliure('Password Must be at least 8 characters'));
        return;
      }
      if (email.isEmpty || password.isEmpty) {
        return emit(AuthFaliure('Email and Password are required'));
      }

      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthSucess(uid: '$email-$password '));
      });
    } catch (e) {
      return emit(AuthFaliure(e.toString()));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print('AuthBLoc-- $change');
  }

  void _onAUthLogoutRequest(event, emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }
}
