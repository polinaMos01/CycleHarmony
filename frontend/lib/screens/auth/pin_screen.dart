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
  bool _isSetupMode = true; // Для переключения режимов

  void _onKeyPressed(String value) {
    if (_pin.length < 4) {
      setState(() {
        _pin += value;
      });
      if (_pin.length == 4) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (_isSetupMode) {
            _showFaceIdDialog();
          } else {
            // Имитация успешной разблокировки
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Успешный вход!')),
            );
            setState(() { _pin = ''; });
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
        backgroundColor: Colors.white.withOpacity(0.9),
        title: Column(
          children: [
            const Icon(Icons.face, size: 60, color: Color(0xFFC9594F)),
            const SizedBox(height: 16),
            Text('Face ID', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
          'Разрешить Cycle Harmony использовать Face ID для быстрого входа?', 
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() { _pin = ''; _isSetupMode = false; });
            },
            child: const Text('Позже', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() { _pin = ''; _isSetupMode = false; });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC9594F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Разрешить', style: TextStyle(color: Colors.white)),
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
          // Чистый фон гор (без цветочного экрана)
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // DEV ТУМБЛЕР (Чтобы показать оба экрана)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isSetupMode = !_isSetupMode;
                        _pin = '';
                      });
                    },
                    icon: const Icon(Icons.swap_horiz, color: Colors.black54),
                    label: Text(
                      _isSetupMode ? 'ДЕМO: Сейчас "Создание ПИН" -> Сменить на "Вход"' 
                                   : 'ДЕМO: Сейчас "Вход" -> Сменить на "Создание"',
                      style: const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Заголовок
                Text(
                  _isSetupMode ? 'Создайте PIN-код' : 'Введите PIN-код',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6B5954),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                Text(
                  _isSetupMode ? 'Для защиты ваших данных' : ' ',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF6B5954).withOpacity(0.7),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // PIN indicators
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
                
                // Numpad (Glassmorphism Кнопки)
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
                        return IconButton(
                          icon: const Icon(Icons.face_unlock_rounded, size: 36, color: Color(0xFF6B5954)),
                          onPressed: () {
                            if (!_isSetupMode) {
                              _showFaceIdDialog();
                            }
                          },
                        );
                      }
                      if (index == 11) {
                        return IconButton(
                          icon: const Icon(Icons.backspace_outlined, size: 28, color: Color(0xFF6B5954)),
                          onPressed: _onBackspacePressed,
                        );
                      }
                      
                      int number = index == 10 ? 0 : index + 1;
                      return GestureDetector(
                        onTap: () => _onKeyPressed(number.toString()),
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2), // Глассморфизм прозрачность
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5), // Светлая каемка
                                  width: 1.5,
                                ),
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                if (!_isSetupMode) ...[
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Забыли ПИН-код?',
                      style: TextStyle(color: const Color(0xFFC9594F), fontSize: 16),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 48), // Место под кнопку, чтобы не прыгало
                ],
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
