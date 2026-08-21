import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacityLeftBranch = 0.0;
  double _opacityRightBranch = 0.0;
  double _opacityText = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimations();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _opacityLeftBranch = 1.0);
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _opacityRightBranch = 1.0);
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _opacityText = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),
          ),
          
          // Блюр по центру
          const Center(
            child: SizedBox(
              width: 300, height: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.white70, blurRadius: 100, spreadRadius: 80)],
                ),
              ),
            ),
          ),

          // Ветка СЛЕВА
          Positioned(
            left: -100, top: 50,
            child: AnimatedOpacity(
              opacity: _opacityLeftBranch, duration: const Duration(milliseconds: 800),
              child: SvgPicture.asset('assets/svg/Object-1.svg', width: 264, clipBehavior: Clip.none),
            ),
          ),
          
          // Ветка СПРАВА
          Positioned(
            right: -80, bottom: -20,
            child: AnimatedOpacity(
              opacity: _opacityRightBranch, duration: const Duration(milliseconds: 800),
              child: SvgPicture.asset('assets/svg/Object.svg', width: 264, clipBehavior: Clip.none),
            ),
          ),
          
          // ЗАГОЛОВОК СТРОГО ЗАФИКСИРОВАН ПО ВЫСОТЕ
          Positioned(
            top: 170, left: 0, right: 0,
            child: AnimatedOpacity(
              opacity: _opacityText, duration: const Duration(milliseconds: 1000),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Cycle Harmony', style: TextStyle(fontFamily: 'BoleroScript', fontSize: 49, color: const Color(0xFFC9594F))),
                  const SizedBox(height: 16),
                  Text('Понимай себя.\nСтрой гармоничные отношения.', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, height: 1.5, color: const Color(0xFF6B5954))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
