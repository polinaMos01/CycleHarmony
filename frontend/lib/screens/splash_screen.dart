import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Навигация временно отключена для ревью
    /*
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/language');
      }
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Чистый фон гор и реки
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Левая веточка
          Positioned(
            left: -130, // Подбираем смещение по Figma (-242)
            top: 135,
            child: SvgPicture.asset(
              'assets/svg/Object.svg',
              width: 264,
            ),
          ),
          
          // Правая веточка
          Positioned(
            right: -60, // Подбираем смещение
            bottom: 50, // Подбираем по Figma (y: 816)
            child: SvgPicture.asset(
              'assets/svg/Object-1.svg',
              width: 264,
            ),
          ),
          
          // Контент по центру
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Название приложения
                Text(
                  'Cycle Harmony',
                  style: TextStyle(
                    fontFamily: 'BoleroScript',
                    fontSize: 49,
                    color: const Color(0xFFC9594F), // rgb(0.79, 0.35, 0.31)
                  ),
                ),
                
                // Отступ (компенсация offset из Figma)
                const SizedBox(height: 20),
                
                // Подзаголовок
                Text(
                  'Понимай себя.\nСтрой гармоничные отношения.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 21 / 14, // lineSpacing 21
                    color: const Color(0xFF6B5954), // rgb(0.42, 0.35, 0.33)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
