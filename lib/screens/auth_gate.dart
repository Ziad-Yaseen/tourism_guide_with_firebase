import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth/auth_cubit.dart';
import '../cubits/favourites/favourites_cubit.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        final favourites = context.read<FavouritesCubit>();
        if (state is AuthAuthenticated) {
          favourites.start(state.user.uid);
        } else if (state is AuthUnauthenticated) {
          favourites.stop();
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) return HomeScreen();
          if (state is AuthInitial) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
