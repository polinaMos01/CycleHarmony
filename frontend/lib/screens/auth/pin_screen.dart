import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  
  bool _isSetupMode = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onPinChanged(String value) {
    if (value.length == 4) {
      _focusNode.unfocus();
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_isSetupMode) {
          _showFaceIdDialog();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Успешный вход!')),
          );
          _pinController.clear();
          setState(() {});
        }
      });
    }
    setState(() {});
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
              setState(() { _pinController.clear(); _isSetupMode = false; });
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: const Text('Позже', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() { _pinController.clear(); _isSetupMode = false; });
              FocusScope.of(context).requestFocus(_focusNode);
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
    String pin = _pinController.text;
    
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      resizeToAvoidBottomInset: false, // Фон не сжимается при вызове клавиатуры
      body: Stack(
        children: [
          // 1. Чистый фон гор
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // 2. Белый блюр под текстом Cycle Harmony
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      blurRadius: 100,
                      spreadRadius: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. Левая веточка
          Positioned(
            left: -120, // В край влево
            top: 130,
            child: SvgPicture.asset(
              'assets/svg/Object.svg',
              width: 264,
              clipBehavior: Clip.none,
            ),
          ),
          
          // 4. Правая веточка
          Positioned(
            right: -60, // В край вправо
            top: -20,
            child: SvgPicture.asset(
              'assets/svg/Object-1.svg',
              width: 264,
              clipBehavior: Clip.none,
            ),
          ),

          // 5. Основной контент (Сдвинут вверх)
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // DEV ТУМБЛЕР
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isSetupMode = !_isSetupMode;
                        _pinController.clear();
                      });
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    icon: const Icon(Icons.swap_horiz, color: Colors.black54),
                    label: Text(
                      _isSetupMode ? 'ДЕМO: "Создание" -> Сменить на "Вход"' 
                                   : 'ДЕМO: "Вход" -> Сменить на "Создание"',
                      style: const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Название приложения
                Text(
                  'Cycle Harmony',
                  style: TextStyle(
                    fontFamily: 'BoleroScript',
                    fontSize: 49,
                    color: const Color(0xFFC9594F),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Подзаголовок
                Text(
                  'Понимай себя.\nСтрой гармоничные отношения.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 21 / 14,
                    color: const Color(0xFF6B5954),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // PIN Заголовок
                Text(
                  _isSetupMode ? 'Создайте PIN-код' : 'Введите PIN-код',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF8A7370), // rgb(0.54, 0.45, 0.44)
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // PIN Индикаторы (4 точки)
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      bool isFilled = index < pin.length;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFilled ? const Color(0xFF3A2121) : Colors.transparent, // rgb(0.23, 0.13, 0.13)
                          border: isFilled ? null : Border.all(
                            color: const Color(0xFF3A2121),
                            width: 0.75,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Кнопка Face ID
                if (!_isSetupMode)
                  GestureDetector(
                    onTap: _showFaceIdDialog,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.face, size: 24, color: Color(0xFFFF7A70)), // rgb(1, 0.48, 0.44)
                        const SizedBox(width: 8),
                        Text(
                          'Войти через Face ID',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFF7A70),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Невидимое поле для нативной клавиатуры
                SizedBox(
                  height: 0,
                  width: 0,
                  child: TextField(
                    controller: _pinController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 4,
                    onChanged: _onPinChanged,
                    showCursor: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(color: Colors.transparent),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
