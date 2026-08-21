import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedIndex = 0; // 0: Русский, 1: English, 2: Монгольский

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Фон
          Positioned.fill(
            child: Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),
          ),

          // Правая веточка
          Positioned(
            right: -60,
            bottom: -50,
            child: SvgPicture.asset('assets/svg/Object.svg', width: 280, clipBehavior: Clip.none),
          ),

          // Заголовок
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Cycle Harmony',
                style: TextStyle(
                  fontFamily: 'BoleroScript',
                  fontSize: 49,
                  color: const Color(0xFFC9594F),
                ),
              ),
            ),
          ),

          // Список языков
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildLanguageOption(
                    index: 0,
                    title: 'Русский',
                    subtitle: 'Russian',
                  ),
                  const SizedBox(height: 16),
                  _buildLanguageOption(
                    index: 1,
                    title: 'English',
                    subtitle: 'English',
                  ),
                  const SizedBox(height: 16),
                  _buildLanguageOption(
                    index: 2,
                    title: 'Монгольский',
                    subtitle: 'Mongolian',
                  ),
                ],
              ),
            ),
          ),

          // Кнопка ДАЛЕЕ
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Переход на следующий экран (Выбор роли)
                  context.push('/role_selection');
                },
                child: Container(
                  width: 329,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFF7ADAF), // Светло-розовый
                        Color(0xFFFF7A70), // Коралловый
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'ДАЛЕЕ',
                    style: GoogleFonts.lora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFDFAF5),
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({required int index, required String title, required String subtitle}) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.85) : Colors.white.withOpacity(0.70),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFFFFEBE8) : const Color(0xFFFDF2EF),
            width: isSelected ? 0.75 : 0.50,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFCC594F).withOpacity(isSelected ? 0.10 : 0.03),
              blurRadius: isSelected ? 20 : 12,
              offset: Offset(0, isSelected ? 6 : 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: isSelected ? const Color(0xFF40261F) : const Color(0xFF6B5954),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: const Color(0xFF8A7370),
                  ),
                ),
              ],
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFFFF7A70) : Colors.transparent,
                border: isSelected ? null : Border.all(color: const Color(0xFFD6CCCE), width: 0.75),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
