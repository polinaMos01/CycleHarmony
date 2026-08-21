import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFDBD4), Colors.white],
            stops: [0.0, 0.5],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              icon: const Icon(Icons.arrow_back, color: Color(0xFFCC594F)),
                              onPressed: () => context.go('/role_selection'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Регистрация',
                            style: TextStyle(fontFamily: 'BoleroScript', fontSize: 48, color: Color(0xFFCC594F)),
                          ),
                          const Spacer(flex: 1), // Push form to center
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
                          const Spacer(flex: 2), // Push button to bottom
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFFF7ADAF), Color(0xFFFF7A70)],
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              ),
                              child: const Text('РЕГИСТРАЦИЯ', style: TextStyle(fontFamily: 'Lora', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: GestureDetector(
                              onTap: () => context.push('/login'),
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
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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
          style: const TextStyle(fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF2E2422)),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xFF8C8785).withOpacity(0.45)),
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
