import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- ЦВЕТОВАЯ ПАЛИТРА CYCLE HARMONY ---
  static const Color coralPrimary = Color(0xFFFF7A70); // Галочка выбора, акценты
  static const Color buttonPink = Color(0xFFFF7A70); // Кнопка "ДАЛЕЕ"
  static const Color buttonText = Color(0xFFFDFAF5); // Текст на кнопке "ДАЛЕЕ"
  static const Color textDarkBrown = Color(0xFF40261F); // Активный текст ("Русский")
  static const Color textLightBrown = Color(0xFF8A7370); // Неактивный текст ("Russian")
  static const Color logoRed = Color(0xFFC9594F); // Цвет логотипа "Cycle Harmony"
  
  static const Color borderActive = Color(0xFFFFEBE8); // Розовая обводка карточки
  static const Color borderInactive = Color(0xFFD6CCCE); // Обводка неактивного кружка
  static const Color shadowCoral = Color(0xFFCC594F); // Тень для карточек

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: coralPrimary,
        primary: coralPrimary,
        primaryContainer: buttonPink,
        onPrimaryContainer: buttonText,
        secondary: logoRed,
        onSurface: textDarkBrown,
        onSurfaceVariant: textLightBrown,
        outline: borderInactive,
        outlineVariant: borderActive,
      ),
      
      // Настройка типографики через GoogleFonts
      textTheme: TextTheme(
        // Заголовки экранов
        displayLarge: const TextStyle(
          fontFamily: 'BoleroScript',
          fontSize: 49,
          color: logoRed,
        ),
        // Основной текст карточек
        bodyLarge: GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textDarkBrown,
        ),
        // Вторичный текст
        bodyMedium: GoogleFonts.manrope(
          fontSize: 14,
          color: textLightBrown,
        ),
        // Мелкий текст (субтитры языков)
        bodySmall: GoogleFonts.manrope(
          fontSize: 12,
          color: textLightBrown,
        ),
        // Текст на кнопках
        labelLarge: GoogleFonts.lora(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: buttonText,
          letterSpacing: 1.0,
        ),
      ),
      
      // Глобальная настройка кнопок
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonPink,
          foregroundColor: buttonText,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          minimumSize: const Size(double.infinity, 48), // Ширина на весь экран, высота 48
        ),
      ),
    );
  }
}
