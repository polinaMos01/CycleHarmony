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
  // Флаги для анимации появления (сначала всё скрыто)
  double _opacityLeftBranch = 0.0;
  double _opacityRightBranch = 0.0;
  double _opacityText = 0.0;

  @override
  void initState() {
    super.initState();
    
    // Запускаем последовательную анимацию
    _startAnimations();

    // Навигация на ПИН-код через 4 секунды (дал чуть больше времени на анимацию)
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) {
        context.go('/pin');
      }
    });
  }

  void _startAnimations() {
    // 1. Появляется левая веточка
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _opacityLeftBranch = 1.0);
    });

    // 2. Появляется правая веточка
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _opacityRightBranch = 1.0);
    });

    // 3. Плавно появляется текст
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _opacityText = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Отключаем обрезку у Stack
        children: [
          // Чистый фон гор и реки
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Белый блюр (всегда под текстом)
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 300,
                height: 150,
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
          ),

          // Левая веточка (Анимированная)
          Positioned(
            left: -80, 
            top: 180,
            child: AnimatedOpacity(
              opacity: _opacityLeftBranch,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              child: SvgPicture.asset(
                'assets/svg/Object-1.svg',
                width: 264,
                clipBehavior: Clip.none, // Запрещаем SVG обрезать свои края
              ),
            ),
          ),
          
          // Правая веточка (Анимированная)
          Positioned(
            right: -30, 
            bottom: -20, 
            child: AnimatedOpacity(
              opacity: _opacityRightBranch,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              child: SvgPicture.asset(
                'assets/svg/Object.svg',
                width: 264,
                clipBehavior: Clip.none, // Запрещаем SVG обрезать свои края
              ),
            ),
          ),
          
          // Основной текст (Анимированный)
          SafeArea(
            child: AnimatedOpacity(
              opacity: _opacityText,
              duration: const Duration(milliseconds: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 200), // Опускаем текст ниже
                  
                  // Название приложения
                  Text(
                    'Cycle Harmony',
                    style: TextStyle(
                      fontFamily: 'BoleroScript',
                      fontSize: 49,
                      color: const Color(0xFFC9594F),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Подзаголовок
                  Text(
                    'Понимай себя.\nСтрой гармоничные отношения.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 21 / 14,
                      color: const Color(0xFF6B5954),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
