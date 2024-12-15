import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/bloc/auth_bloc.dart';
import 'package:login_app_bloc/login_screen.dart';
import 'package:login_app_bloc/widgets/gradient_button.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // If the state is AuthInitial, navigate to the login screen.
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          // Show loading indicator if AuthLoading state
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Show UI for AuthSuccess state
          if (state is AuthSucess) {
            return Center(
              child: Column(
                children: [
                  Text(state.uid), // Safely access the uid from AuthSuccess
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogOutRequested());
                    },
                  ),
                ],
              ),
            );
          }

          // Default case (optional): Return a fallback or error state
          return const Center(
            child: Text('Unexpected state'),
          );
        },
      ),
    );
  }
}
