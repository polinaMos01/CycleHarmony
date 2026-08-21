import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFDBD4),
          image: DecorationImage(
            image: AssetImage('assets/images/role_selection_bg.png'),
            fit: BoxFit.cover,
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
                            child: InkWell(
                              onTap: () => context.go('/login'),
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
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Восстановление\nпароля',
                            style: TextStyle(fontFamily: 'BoleroScript', fontSize: 48, color: Color(0xFFCC594F), height: 1.1),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Введите ваш Email, и мы отправим вам волшебную ссылку для сброса пароля.',
                            style: GoogleFonts.manrope(fontSize: 12, color: const Color(0xFF8A7370)),
                          ),
                          const Spacer(flex: 1),
                          _buildField('Email', 'name@domain.com'),
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
                              child: Text('Отправить ссылку', style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: GestureDetector(
                              onTap: () => context.go('/login'),
                              child: Text(
                                'Вернуться ко входу',
                                style: TextStyle(fontFamily: "PTRootUI", 
                                  fontSize: 14,
                                  color: const Color(0xFFF7ADAF),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFFF7ADAF),
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
