import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/features/language/presentation/screens/language_screen.dart';
import 'package:frontend/features/auth/presentation/screens/pin_screen.dart';
import 'package:frontend/features/role_selection/presentation/screens/role_selection_screen.dart';
import 'package:frontend/features/auth/presentation/screens/password_recovery_screen.dart';
import 'package:frontend/features/onboarding/presentation/screens/onboarding_screen.dart';

import 'package:frontend/features/auth/presentation/screens/splash_screen.dart';
import 'package:frontend/features/questionnaire/presentation/screens/calendar_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/language',
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
    GoRoute(
      path: '/questionnaire_calendar',
      builder: (context, state) => const CalendarScreen(),
    ),
  ],
);
