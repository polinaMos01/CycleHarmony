import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            child: _buildBackButton(context, '/register'),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Вход',
                            style: TextStyle(fontFamily: 'BoleroScript', fontSize: 48, color: Color(0xFFCC594F)),
                          ),
                          const Spacer(flex: 1),
                          _buildField('Email', 'name@domain.com'),
                          const SizedBox(height: 24),
                          _PasswordField(
                            label: 'Пароль',
                            placeholder: '••••••••••••',
                            trailingText: 'Забыли пароль?',
                            onTrailingTap: () => context.go('/forgot_password'),
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
                              child: Text('ВОЙТИ', style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: Text(
                              'или продолжить с помощью',
                              style: TextStyle(fontFamily: "PTRootUI", fontSize: 14, color: const Color(0xFF919191)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialIcon('assets/svg/vk.svg'),
                              const SizedBox(width: 16),
                              _buildSocialIcon('assets/svg/apple.svg'),
                              const SizedBox(width: 16),
                              _buildSocialIcon('assets/svg/google.svg'),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: GestureDetector(
                              onTap: () => context.go('/register'),
                              child: Text.rich(
                                TextSpan(
                                  text: 'Ещё не зарегистрированы? ',
                                  style: TextStyle(fontFamily: "PTRootUI", fontSize: 14, color: const Color(0xFF919191)),
                                  children: [
                                    TextSpan(
                                      text: 'РЕГИСТРАЦИЯ',
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

  Widget _buildSocialIcon(String asset) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF7ADAF), Color(0xFFFF958F)],
        ),
      ),
      child: SvgPicture.asset(asset, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
    );
  }
}

class _PasswordField extends StatefulWidget {
  final String label;
  final String placeholder;
  final String? trailingText;
  final VoidCallback? onTrailingTap;

  const _PasswordField({required this.label, required this.placeholder, this.trailingText, this.onTrailingTap});

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label.toUpperCase(),
              style: TextStyle(fontFamily: "PTRootUI", fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFFFF7A70)),
            ),
            if (widget.trailingText != null)
              GestureDetector(
                onTap: widget.onTrailingTap,
                child: Text(
                  widget.trailingText!,
                  style: TextStyle(fontFamily: "PTRootUI", fontSize: 12, color: const Color(0xFF3B2121), decoration: TextDecoration.underline, decorationColor: const Color(0xFF3B2121)),
                ),
              ),
          ],
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
