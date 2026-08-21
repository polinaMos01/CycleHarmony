import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:frontend/features/auth/presentation/screens/splash_screen.dart';
import 'package:frontend/features/auth/presentation/screens/pin_screen.dart';
import 'package:frontend/features/language/presentation/screens/language_screen.dart';
import 'package:frontend/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:frontend/features/role_selection/presentation/screens/role_selection_screen.dart';

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
  ],
);
