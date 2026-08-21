import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDBD4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Вход',
                style: TextStyle(
                  fontFamily: 'BoleroScript',
                  fontSize: 48,
                  color: Color(0xFFCC594F),
                ),
              ),
              const SizedBox(height: 40),
              _buildField('Email', 'name@domain.com'),
              const SizedBox(height: 24),
              _buildField('Пароль', '••••••••••••', isPassword: true, trailingText: 'Забыли пароль?'),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7ADAF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    elevation: 0,
                  ),
                  child: const Text('ВОЙТИ', style: TextStyle(fontFamily: 'Lora', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'или продолжить с помощью',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Color(0xFF919191)),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(Icons.apple),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.g_mobiledata),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.facebook),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/register'),
                  child: const Text.rich(
                    TextSpan(
                      text: 'Ещё не зарегистрированы? ',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Color(0xFF919191)),
                      children: [
                        TextSpan(
                          text: 'Регистрация',
                          style: TextStyle(color: Color(0xFFF7ADAF), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String placeholder, {bool isPassword = false, String? trailingText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(fontFamily: 'Inter', fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFFF7A70)),
            ),
            if (trailingText != null)
              Text(
                trailingText,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 12, color: Color(0xFF3B2121), decoration: TextDecoration.underline),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: Color(0xFF8C8785)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD6CCCC))),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF7A70))),
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 8),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF7ADAF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
