import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qcdart/auth/app_auth.dart';
import 'package:qcdart/screen/dashboard.dart';
import 'package:qcdart/screen/forget.dart';
import 'package:qcdart/screen/login.dart';
import 'package:qcdart/screen/register.dart';

enum RoutePath {
  signIn(path: '/'),
  signUp(path: 'sign_up'),
  forgetPassword(path: 'forget_password'),

  dashboard(path: '/dashboard');

  const RoutePath({
    required this.path,
  });
  final String path;
}

/// The global router for the app
final router = GoRouter(
  redirect:(context, state) async {
    // Check if the token is expired
    final token = await isTokenExpired();

    // Debug the token and the current route
    if (kDebugMode) print("Token: $token ${state.topRoute!.name}");

    // Redirect to the sign in page if the token is expired
    if (token &&  [RoutePath.signIn.name, RoutePath.signUp.path, RoutePath.forgetPassword.path].contains(state.topRoute!.name)) {
      return RoutePath.signIn.path;
    } else if (!token && state.topRoute!.name == RoutePath.signIn.name) {
      return RoutePath.dashboard.path;
    }

    // Return null if no redirection is needed
    return null;
  },
  routes: [
    // Sign in & Sign up route
    GoRoute(
      path: RoutePath.signIn.path,
      name: RoutePath.signIn.name,
      pageBuilder: (context, state) => const MaterialPage(
        child: LoginScreen(),
      ),
      routes: [
        GoRoute(
          path: RoutePath.signUp.path,
          name: RoutePath.signUp.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: RegisterScreen(),
          ),
        ),
        GoRoute(
          path: RoutePath.forgetPassword.path,
          name: RoutePath.forgetPassword.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: ForgetScreen(),
          )
        )
      ]
    ),

    // Dashboard route
    GoRoute(
      path: RoutePath.dashboard.path,
      name: RoutePath.dashboard.name,
      pageBuilder: (context, state) => const MaterialPage(
        child: DashboardScreen(),
      ),
    ),
  ],
);
