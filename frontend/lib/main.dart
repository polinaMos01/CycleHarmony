import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'routes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CycleHarmonyApp(),
    ),
  );
}

class CycleHarmonyApp extends ConsumerWidget {
  const CycleHarmonyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Cycle Harmony',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
