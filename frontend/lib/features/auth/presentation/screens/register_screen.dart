import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              const SizedBox(height: 40),
              const Text(
                'Регистрация',
                style: TextStyle(
                  fontFamily: 'BoleroScript',
                  fontSize: 48,
                  color: Color(0xFFCC594F),
                ),
              ),
              const SizedBox(height: 40),
              _buildField('ИМЯ', 'Введите ваше имя'),
              const SizedBox(height: 24),
              _buildField('Email', 'name@domain.com'),
              const SizedBox(height: 24),
              _buildField('Пароль', '••••••••••••', isPassword: true),
              const SizedBox(height: 24),
              _buildField('ПОВТОРИТЕ ПАРОЛЬ', '••••••••••••', isPassword: true),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.check, size: 16, color: Color(0xFFFF7A70)),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Согласен с условиями использования и конфиденциальности',
                      style: TextStyle(fontFamily: 'Manrope', fontSize: 12, color: Color(0xFF8A7370)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
                  child: const Text('РЕГИСТРАЦИЯ', style: TextStyle(fontFamily: 'Lora', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/login'),
                  child: const Text.rich(
                    TextSpan(
                      text: 'Уже есть аккаунт? ',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Color(0xFF919191)),
                      children: [
                        TextSpan(
                          text: 'Войти',
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

  Widget _buildField(String label, String placeholder, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontFamily: 'Inter', fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFFF7A70)),
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
            suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: Color(0xFFAB858F), size: 20) : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          ),
        ),
      ],
    );
  }
}
