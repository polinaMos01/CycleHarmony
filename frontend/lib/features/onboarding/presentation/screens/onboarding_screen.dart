import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/core/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Здесь будет переход на экран регистрации/входа
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Дальше будет экран Регистрации/Входа (в разработке)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Backgrounds and Text PageView
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildPage(
                title: "Понимай себя \nи своего партнёра",
                subtitle: "Раскрой свои сильные стороны, пойми потребности партнёра и строй крепкие отношения каждый день",
                bgImage: 'assets/images/onboarding_bg_1.png',
              ),
              _buildPage(
                title: "Вместе \nна одной волне",
                subtitle: "Поделитесь своим настроением, биоритмами и важными периодами с вашим любимым человеком. Стройте гармонию вместе без лишних вопросов.",
                bgImage: 'assets/images/onboarding_bg_1.png', // reusing couple image
              ),
              _buildPage(
                title: "Гармония \nначинается с тебя",
                subtitle: "Отслеживайте цикл, настроение, здоровье — и получайте персональные рекомендации от ИИ",
                bgImage: 'assets/images/onboarding_bg_3.png',
              ),
            ],
          ),

          // Bottom Controls (Button and Dots)
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ДАЛЕЕ / НАЧАТЬ Button
                SizedBox(
                  width: 329,
                  height: 48,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFF7ADAF), // Светло-розовый
                          AppTheme.coralPrimary, // Коралловый
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        _currentPage == 2 ? 'НАЧАТЬ' : 'ДАЛЕЕ',
                        style: GoogleFonts.lora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.buttonText,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Pagination Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    bool isActive = _currentPage == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: isActive ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isActive 
                            ? const Color(0xFFD98C8C) // Активный (из SwiftUI)
                            : const Color(0xFFD98C8C).withOpacity(0.35),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10), // safe area buffer
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({required String title, required String subtitle, required String bgImage}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        Image.asset(
          bgImage,
          fit: BoxFit.cover,
        ),
        // Text Content Overlay
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'BoleroScript',
                    fontSize: 49,
                    height: 1.1,
                    color: AppTheme.logoRed,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    height: 1.5,
                    color: const Color(0xFF6B5954),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
