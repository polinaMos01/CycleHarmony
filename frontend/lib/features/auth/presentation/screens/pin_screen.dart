import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

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
          context.push('/language');
        }
      });
    }
    setState(() {});
  }

  void _showFaceIdDialog() {
    // В реальном приложении здесь будет вызываться нативный системный Face ID / Touch ID (пакет local_auth),
    // который отрисовывается самой операционной системой (iOS / Android), а не нашими виджетами.
    // Для демо на вебе мы просто имитируем успешное завершение настройки.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Вызван системный нативный Face ID (iOS/Android)'), duration: Duration(seconds: 2)),
    );
    
    Future.delayed(const Duration(seconds: 1), () {
      setState(() { _pinController.clear(); _isSetupMode = false; });
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    String pin = _pinController.text;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // SKIP TO NEXT SCREEN ON ANY TAP FOR DEMO
          context.push('/language');
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover)),
            
            // Блюр по центру
            const Center(
              child: SizedBox(
                width: 300, height: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.white70, blurRadius: 100, spreadRadius: 80)],
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () { setState(() { _isSetupMode = !_isSetupMode; _pinController.clear(); }); FocusScope.of(context).requestFocus(_focusNode); },
                        icon: const Icon(Icons.swap_horiz, color: Colors.black54),
                        label: Text(_isSetupMode ? 'Создание -> Вход' : 'Вход -> Создание', style: const TextStyle(fontFamily: "PTRootUI", color: Colors.black54, fontSize: 12)),
                      ),
                      TextButton.icon(
                        onPressed: () => context.push('/language'),
                        icon: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
                        label: const Text('ПРОПУСТИТЬ ПИН', style: TextStyle(fontFamily: "PTRootUI", color: Colors.blueAccent, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ЗАГОЛОВОК СТРОГО ЗАФИКСИРОВАН ПО ВЫСОТЕ
            Positioned(
              top: 170, left: 0, right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Cycle Harmony', style: TextStyle(fontFamily: 'BoleroScript', fontSize: 49, color: const Color(0xFFC9594F))),
                  const SizedBox(height: 16),
                  Text('Понимай себя.\nСтрой гармоничные отношения.', textAlign: TextAlign.center, style: TextStyle(fontFamily: "PTRootUI", fontSize: 14, height: 1.5, color: const Color(0xFF6B5954))),
                ],
              ),
            ),
            
            // PIN Блок ОПУЩЕН НИЖЕ ОТ ЦЕНТРА (ЖЕСТКАЯ ВЫСОТА)
            Positioned(
              top: 430, left: 0, right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                          SvgPicture.asset(
                            'assets/svg/scan-face.svg',
                            width: 24, height: 24,
                            colorFilter: const ColorFilter.mode(Color(0xFFFF7A70), BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          Text('Войти через Face ID', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFFFF7A70))),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 0, width: 0, child: TextField(controller: _pinController, focusNode: _focusNode, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], maxLength: 4, onChanged: _onPinChanged, showCursor: false, style: const TextStyle(fontFamily: "PTRootUI", color: Colors.transparent), decoration: const InputDecoration(border: InputBorder.none, counterText: ''))),
          ],
        ),
      ),
    );
  }
}
