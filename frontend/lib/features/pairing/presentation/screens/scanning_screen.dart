import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              const Text(
                'Сканируйте QR-код или введите ссылку приглашения',
                style: TextStyle(fontFamily: 'Manrope', fontSize: 14, color: Color(0xFF5C6E7D), height: 1.4),
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
              const Text(
                'Наведите камеру на QR-код',
                style: TextStyle(fontFamily: 'Manrope', fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF5C6E7D)),
              ),
              const SizedBox(height: 32),
              // OR divider
              Row(
                children: [
                  const Expanded(child: Divider(color: Color(0xFFD1D9E3))),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('или', style: TextStyle(fontFamily: 'Manrope', fontSize: 14, color: Color(0xFF8C9BA6))),
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
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Вставьте ссылку приглашения',
                          hintStyle: TextStyle(fontFamily: 'Manrope', fontSize: 15, color: Color(0xFF9BAFC1)),
                        ),
                      ),
                    ),
                    Icon(Icons.link, color: Color(0xFF3B6B8C)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7D9FCA), // Blue button
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    elevation: 0,
                  ),
                  child: const Text('РЕДАКТИРОВАТЬ', style: TextStyle(fontFamily: 'Lora', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ввести код вручную',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B6B8C),
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
