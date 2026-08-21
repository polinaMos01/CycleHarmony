import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanningScreen extends StatelessWidget {
  const ScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F2F7), // Light blue bg
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF1A2B3B)),
                  onPressed: () => context.go('/role_selection'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Привязка к паре',
                style: TextStyle(
                  fontFamily: 'BoleroScript',
                  fontSize: 36,
                  color: Color(0xFF1A2B3B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Сканируйте QR-код или введите ссылку приглашения',
                style: GoogleFonts.manrope(fontSize: 14, color: const Color(0xFF5C6E7D), height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // QR Box
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFF3B6B8C), width: 1, style: BorderStyle.solid), // In real life, dashed border
                ),
                child: const Center(
                  child: Icon(Icons.qr_code_scanner, size: 64, color: Color(0xFF3B6B8C)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Наведите камеру на QR-код',
                style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w500, color: const Color(0xFF5C6E7D)),
              ),
              const SizedBox(height: 32),
              // OR divider
              Row(
                children: [
                  const Expanded(child: Divider(color: Color(0xFFD1D9E3))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('или', style: GoogleFonts.manrope(fontSize: 14, color: const Color(0xFF8C9BA6))),
                  ),
                  const Expanded(child: Divider(color: Color(0xFFD1D9E3))),
                ],
              ),
              const SizedBox(height: 32),
              // Link input
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD1D9E3)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.manrope(fontSize: 15, color: const Color(0xFF1A2B3B)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Вставьте ссылку приглашения',
                          hintStyle: GoogleFonts.manrope(fontSize: 15, color: const Color(0xFF9BAFC1)),
                        ),
                      ),
                    ),
                    const Icon(Icons.link, color: Color(0xFF3B6B8C)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF9ABAE1), Color(0xFF678BB7)], // Blue gradient
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  child: Text('РЕДАКТИРОВАТЬ', style: GoogleFonts.lora(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ввод кода вручную (экран в разработке)')),
                  );
                },
                child: Text(
                  'Ввести код вручную',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3B6B8C),
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFF3B6B8C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
