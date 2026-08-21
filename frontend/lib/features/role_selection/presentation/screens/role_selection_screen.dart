import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/core/theme/app_theme.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  // 0 = Girl, 1 = Partner
  int _selectedRole = 0;

  void _onContinue() {
    if (_selectedRole == 0) {
      // Girl -> Authorization
      // context.go('/auth'); // TODO: Create auth screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Переход на Авторизацию')),
      );
    } else {
      // Partner -> Scanning
      // context.go('/scanning'); // TODO: Create scanning screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Переход на Сканирование')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/role_selection_bg.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Добро пожаловать!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color(0xFF992626), // #992626
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Кто вы?',
                  style: TextStyle(
                    fontFamily: 'BoleroScript',
                    fontSize: 48,
                    color: Color(0xFFCC594F), // #CC594F
                  ),
                ),
                const SizedBox(height: 60),
                const Text(
                  'Выберите вашу роль для индивидуальной настройки цикла, подсказок и общего календаря.',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 12,
                    color: Color(0xFF8A7370), // #8A7370
                  ),
                ),
                const SizedBox(height: 32),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                      child: _RoleCard(
                        title: 'Девушка',
                        subtitle: 'Отслеживание цикла, дневник и аналитика',
                        iconBgColor: const Color(0xFFFFDBD4), // #FFDBD4
                        iconColor: const Color(0xFFFF7A70),
                        icon: Icons.female,
                        isSelected: _selectedRole == 0,
                        onTap: () {
                          setState(() {
                            _selectedRole = 0;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _RoleCard(
                        title: 'Партнёр',
                        subtitle: 'Поддержка, подсказки и синхронизация',
                        iconBgColor: const Color(0xFFE3E3E3), // #E3E3E3
                        iconColor: Colors.black54,
                        icon: Icons.male,
                        isSelected: _selectedRole == 1,
                        onTap: () {
                          setState(() {
                            _selectedRole = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _onContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF7ADAF), // #F7ADAF
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'ПРОДОЛЖИТЬ',
                        style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
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
  final String subtitle;
  final Color iconBgColor;
  final Color iconColor;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.iconBgColor,
    required this.iconColor,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFF0E3E0), // #F0E3E0
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
                // Radio button indicator
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? const Color(0xFFFF7A70) : Colors.transparent,
                    border: isSelected ? null : Border.all(
                      color: const Color(0xFFD6CCCC),
                      width: 1,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'BoleroScript',
                fontSize: 28,
                color: Color(0xFF3B2121), // #3B2121
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8A7370), // #8A7370
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
