import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/screens/auth/language_screen.dart';
import 'package:frontend/screens/auth/pin_screen.dart';
import 'package:frontend/screens/auth/role_selection_screen.dart';
import 'package:frontend/screens/auth/password_recovery_screen.dart';
import 'package:frontend/screens/onboarding/onboarding_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      path: '/pin',
      builder: (context, state) => const PinScreen(),
    ),
    GoRoute(
      path: '/role_selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/password_recovery',
      builder: (context, state) => const PasswordRecoveryScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
