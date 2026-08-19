import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    Future.delayed(const Duration(milliseconds: 100), () => FocusScope.of(context).requestFocus(_focusNode));
  }

  void _onPinChanged(String value) {
    if (value.length == 4) {
      _focusNode.unfocus();
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_isSetupMode) {
          _showFaceIdDialog();
        } else {
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
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFFF3F3F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Face ID', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w700, color: const Color(0xFF221F1F))),
              const SizedBox(height: 16),
              Text('Разрешить Cycle Harmony использовать\nFace ID для быстрого входа?', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 15, height: 1.5, color: const Color(0xFF221F1F))),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() { _pinController.clear(); _isSetupMode = false; });
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    style: TextButton.styleFrom(fixedSize: const Size(120, 50)),
                    child: Text('Позже', style: GoogleFonts.merriweather(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF999999))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() { _pinController.clear(); _isSetupMode = false; });
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC9594F), fixedSize: const Size(140, 50), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: Text('Разрешить', style: GoogleFonts.merriweather(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String pin = _pinController.text;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover)),
          
          Positioned(
            top: 200, left: 0, right: 0,
            child: Center(
              child: Container(
                width: 300, height: 150,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.8), blurRadius: 100, spreadRadius: 80)]),
              ),
            ),
          ),

          // (Ветки удалены по просьбе пользователя)

          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton.icon(
                  onPressed: () { setState(() { _isSetupMode = !_isSetupMode; _pinController.clear(); }); FocusScope.of(context).requestFocus(_focusNode); },
                  icon: const Icon(Icons.swap_horiz, color: Colors.black54),
                  label: Text(_isSetupMode ? 'ДЕМO: "Создание" -> Вход' : 'ДЕМO: "Вход" -> Создание', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // СИЛЬНО ОПУСКАЕМ ТЕКСТ ВНИЗ
                  const SizedBox(height: 120), 
                  Text('Cycle Harmony', style: TextStyle(fontFamily: 'BoleroScript', fontSize: 49, color: const Color(0xFFC9594F))),
                  const SizedBox(height: 16),
                  Text('Понимай себя.\nСтрой гармоничные отношения.', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, height: 1.5, color: const Color(0xFF6B5954))),
                  
                  // СИЛЬНО ОПУСКАЕМ БЛОК ПИН КОДА ЕЩЕ НИЖЕ
                  const SizedBox(height: 180),
                  
                  Text(_isSetupMode ? 'Создайте PIN-код' : 'Введите PIN-код', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF8A7370))),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => FocusScope.of(context).requestFocus(_focusNode),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        bool isFilled = index < pin.length;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 16, height: 16,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: isFilled ? const Color(0xFF3A2121) : Colors.transparent, border: isFilled ? null : Border.all(color: const Color(0xFF3A2121), width: 0.75)),
                        );
                      }),
                    ),
                  ),
                  if (!_isSetupMode) ...[
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: _showFaceIdDialog,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.face_retouching_natural, size: 24, color: Color(0xFFFF7A70)),
                          const SizedBox(width: 8),
                          Text('Войти через Face ID', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFFFF7A70))),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(height: 0, width: 0, child: TextField(controller: _pinController, focusNode: _focusNode, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], maxLength: 4, onChanged: _onPinChanged, showCursor: false, style: const TextStyle(color: Colors.transparent), decoration: const InputDecoration(border: InputBorder.none, counterText: ''))),
        ],
      ),
    );
  }
}
