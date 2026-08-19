import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String _pin = '';
  final bool _isSetupMode = true; // Для демо: true - установка, false - разблокировка

  void _onKeyPressed(String value) {
    if (_pin.length < 4) {
      setState(() {
        _pin += value;
      });
      if (_pin.length == 4) {
        // Если пин введен полностью
        Future.delayed(const Duration(milliseconds: 300), () {
          if (_isSetupMode) {
            _showFaceIdDialog();
          } else {
            // Успешный вход
            context.go('/role_selection');
          }
        });
      }
    }
  }

  void _onBackspacePressed() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  void _showFaceIdDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Использовать Face ID?', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        content: Text('Входить в приложение по лицу намного быстрее и безопаснее.', style: GoogleFonts.inter()),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/role_selection'); // Продолжаем дальше
            },
            child: const Text('Позже', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/role_selection');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC9594F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Включить', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Фон с запеченным текстом (блюрим его)
          Positioned.fill(
            child: Image.asset(
              'assets/images/01-lock-screen.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Эффект матового стекла, чтобы скрыть старый текст на картинке
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.white.withOpacity(0.3), // Легкое осветление
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                
                // Заголовок
                Text(
                  _isSetupMode ? 'Установите PIN-код' : 'Введите PIN-код',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6B5954),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                Text(
                  _isSetupMode ? 'Для защиты ваших данных' : '',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF6B5954).withOpacity(0.7),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // PIN indicators (кружочки)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    bool isFilled = index < _pin.length;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFilled ? const Color(0xFFC9594F) : Colors.transparent,
                        border: Border.all(
                          color: const Color(0xFFC9594F),
                          width: 2,
                        ),
                      ),
                    );
                  }),
                ),
                
                const Spacer(),
                
                // Numpad (Клавиатура)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      if (index == 9) {
                        // Кнопка Face ID
                        return IconButton(
                          icon: const Icon(Icons.face_unlock_rounded, size: 36, color: Color(0xFF6B5954)),
                          onPressed: () {
                            if (!_isSetupMode) {
                              context.go('/role_selection');
                            }
                          },
                        );
                      }
                      if (index == 11) {
                        // Кнопка Backspace
                        return IconButton(
                          icon: const Icon(Icons.backspace_outlined, size: 28, color: Color(0xFF6B5954)),
                          onPressed: _onBackspacePressed,
                        );
                      }
                      
                      // Цифры 1-9 и 0
                      int number = index == 10 ? 0 : index + 1;
                      return GestureDetector(
                        onTap: () => _onKeyPressed(number.toString()),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Text(
                              number.toString(),
                              style: GoogleFonts.inter(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF6B5954),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
