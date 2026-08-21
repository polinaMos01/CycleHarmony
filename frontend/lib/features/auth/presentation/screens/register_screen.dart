import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            child: _buildBackButton(context, '/role_selection'),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Регистрация',
                            style: TextStyle(fontFamily: 'BoleroScript', fontSize: 48, color: Color(0xFFCC594F)),
                          ),
                          const Spacer(flex: 1),
                          _buildField('ИМЯ', 'Введите ваше имя'),
                          const SizedBox(height: 24),
                          _buildField('Email', 'name@domain.com'),
                          const SizedBox(height: 24),
                          const _PasswordField(label: 'Пароль', placeholder: '••••••••••••'),
                          const SizedBox(height: 24),
                          const _PasswordField(label: 'ПОВТОРИТЕ ПАРОЛЬ', placeholder: '••••••••••••'),
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
                              Expanded(
                                child: Text(
                                  'Согласен с условиями использования и конфиденциальности',
                                  style: GoogleFonts.manrope(fontSize: 12, color: const Color(0xFF8A7370)),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(flex: 2),
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
                              child: Text('РЕГИСТРАЦИЯ', style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: GestureDetector(
                              onTap: () => context.go('/login'),
                              child: Text.rich(
                                TextSpan(
                                  text: 'Уже есть аккаунт? ',
                                  style: TextStyle(fontFamily: "PTRootUI", fontSize: 14, color: const Color(0xFF919191)),
                                  children: [
                                    TextSpan(
                                      text: 'Войти',
                                      style: TextStyle(fontFamily: "PTRootUI", 
                                        color: const Color(0xFFF7ADAF),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: const Color(0xFFF7ADAF),
                                      ),
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

  Widget _buildBackButton(BuildContext context, String route) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF7ADAF).withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back, color: Color(0xFFCC594F), size: 20),
      ),
    );
  }

  Widget _buildField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(fontFamily: "PTRootUI", fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFFFF7A70)),
        ),
        const SizedBox(height: 8),
        TextField(
          style: TextStyle(fontFamily: "PTRootUI", fontSize: 15, fontWeight: FontWeight.w600, color: const Color(0xFF2E2422)),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(fontFamily: "PTRootUI", fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xFF8C8785).withOpacity(0.45)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD6CCCC))),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF7A70))),
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 8),
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  final String label;
  final String placeholder;

  const _PasswordField({required this.label, required this.placeholder});

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: TextStyle(fontFamily: "PTRootUI", fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFFFF7A70)),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: _obscure,
          style: TextStyle(fontFamily: "PTRootUI", fontSize: 15, fontWeight: FontWeight.w600, color: const Color(0xFF2E2422)),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(fontFamily: "PTRootUI", fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xFF8C8785).withOpacity(0.45)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD6CCCC))),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF7A70))),
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 8),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
              child: Icon(
                _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: const Color(0xFFAB858F),
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          ),
        ),
      ],
    );
  }
}
