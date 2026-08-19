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
    // Навигация на ПИН-код через 3 секунды
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/pin');
      }
    });
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
          
          // Левые и правые веточки временно убраны из-за кривого экспорта SVG
          
          // Белый блюр (свечение) под текстом
          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    blurRadius: 100,
                    spreadRadius: 80,
                  ),
                ],
              ),
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
