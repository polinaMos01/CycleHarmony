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
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (mounted) context.go('/pin');
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
          
          Positioned(
            top: 200, left: 0, right: 0,
            child: Center(
              child: Container(
                width: 300, height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.8), blurRadius: 100, spreadRadius: 80)],
                ),
              ),
            ),
          ),

          // Ветка СЛЕВА (Object-1.svg)
          Positioned(
            left: -100, top: 150,
            child: AnimatedOpacity(
              opacity: _opacityLeftBranch, duration: const Duration(milliseconds: 800),
              child: SvgPicture.asset('assets/svg/Object-1.svg', width: 264, clipBehavior: Clip.none),
            ),
          ),
          
          // Ветка СПРАВА (Object.svg)
          Positioned(
            right: -80, bottom: -20,
            child: AnimatedOpacity(
              opacity: _opacityRightBranch, duration: const Duration(milliseconds: 800),
              child: SvgPicture.asset('assets/svg/Object.svg', width: 264, clipBehavior: Clip.none),
            ),
          ),
          
          SafeArea(
            child: AnimatedOpacity(
              opacity: _opacityText, duration: const Duration(milliseconds: 1000),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
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
            ),
          ),
        ],
      ),
    );
  }
}
