import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/features/auth/presentation/screens/splash_screen.dart';
import 'package:frontend/features/auth/presentation/screens/pin_screen.dart';
import 'package:frontend/features/language/presentation/screens/language_screen.dart';
import 'package:frontend/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:frontend/features/role_selection/presentation/screens/role_selection_screen.dart';
import 'package:frontend/features/auth/presentation/screens/register_screen.dart';
import 'package:frontend/features/auth/presentation/screens/login_screen.dart';
import 'package:frontend/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:frontend/features/pairing/presentation/screens/scanning_screen.dart';
import 'package:frontend/features/profile_setup/presentation/screens/notifications_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/pin',
      builder: (context, state) => const PinScreen(),
    ),
    GoRoute(
      path: '/language',
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/role_selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/forgot_password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/scanning',
      builder: (context, state) => const ScanningScreen(),
    ),
  ],
);
