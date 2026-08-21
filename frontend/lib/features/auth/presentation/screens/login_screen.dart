import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFDBD4),
              Colors.white,
            ],
            stops: [0.0, 0.5],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF992626)),
                    onPressed: () => context.pop(),
                  ),
                ),
                const SizedBox(height: 10),
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
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFF7ADAF), // Light pink
                        Color(0xFFFF7A70), // Coral primary
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w600, // Bold for actual input
            color: Color(0xFF2E2422), // Darker text for input
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              fontFamily: 'Inter', 
              fontSize: 14, 
              fontWeight: FontWeight.w400, // Thinner for placeholder
              color: const Color(0xFF8C8785).withOpacity(0.45), // More transparent
            ),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD6CCCC))),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF7A70))),
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 8),
            suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: Color(0xFFAB858F), size: 20) : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
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
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF7ADAF), // Light pink
            Color(0xFFFF958F), // Slightly darker pink for subtle gradient
          ],
        ),
      ),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
