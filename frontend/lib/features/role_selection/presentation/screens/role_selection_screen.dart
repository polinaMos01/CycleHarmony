import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  int _selectedRole = 0; // 0 for Girl, 1 for Partner

  void _onContinue() {
    if (_selectedRole == 0) {
      context.go('/register');
    } else {
      context.go('/scanning');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/role_selection_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Кто вы?',
                  style: TextStyle(
                    fontFamily: 'BoleroScript',
                    fontSize: 48,
                    color: Color(0xFFCC594F),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Выберите вашу роль для индивидуальной настройки цикла, подсказок и общего календаря.',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    color: const Color(0xFF3B2121),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _RoleCard(
                            title: 'Девушка',
                            description: 'отслеживание менструации, симптомов и настроения',
                            icon: 'assets/svg/solar_women-broken.svg',
                            isSelected: _selectedRole == 0,
                            onTap: () => setState(() => _selectedRole = 0),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _RoleCard(
                            title: 'Партнёр',
                            description: 'наблюдение за циклом партнёрши, полезные советы',
                            icon: 'assets/svg/solar_men-broken.svg',
                            isSelected: _selectedRole == 1,
                            onTap: () => setState(() => _selectedRole = 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    onPressed: _onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    child: Text(
                      'ПРОДОЛЖИТЬ',
                      style: GoogleFonts.lora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isSelected ? const Color(0xFFCC594F) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFCC594F) : const Color(0xFFC4B8B8),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFCC594F),
                        ),
                      ),
                    )
                  : null,
            ),
            const Spacer(),
            SvgPicture.asset(icon, width: 32, height: 32, colorFilter: const ColorFilter.mode(Color(0xFFCC594F), BlendMode.srcIn)),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'PTRootUI',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B2121),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.manrope(
                fontSize: 13,
                color: const Color(0xFF8A7370),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
