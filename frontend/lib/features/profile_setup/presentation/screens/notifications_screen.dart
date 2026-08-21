import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _cycleReminders = true;
  bool _partnerCare = true;
  bool _aiAdvice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFDBD4), Colors.white],
            stops: [0.0, 0.4],
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
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            'Уведомления',
                            style: TextStyle(fontFamily: 'BoleroScript', fontSize: 48, color: Color(0xFFCC594F)),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Разрешите уведомления, чтобы мгновенно узнавать о заботливых действиях вашего партнера, вовремя заполнять дневник настроения и получать рекомендации искусственного интеллекта.',
                            style: GoogleFonts.manrope(fontSize: 13, color: const Color(0xFF8A7370), height: 1.5),
                          ),
                          const SizedBox(height: 40),
                          _buildToggleItem(
                            title: 'Напоминания о цикле',
                            subtitle: 'Уведомления о фазах, ПМС и овуляции',
                            value: _cycleReminders,
                            onChanged: (val) => setState(() => _cycleReminders = val),
                          ),
                          const SizedBox(height: 24),
                          _buildToggleItem(
                            title: 'Забота от партнера',
                            subtitle: 'Тёплые слова и действия',
                            value: _partnerCare,
                            onChanged: (val) => setState(() => _partnerCare = val),
                          ),
                          const SizedBox(height: 24),
                          _buildToggleItem(
                            title: 'AI-советы и рекомендации',
                            subtitle: 'Поддержка самочувствия и психологии',
                            value: _aiAdvice,
                            onChanged: (val) => setState(() => _aiAdvice = val),
                          ),
                          const Spacer(),
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
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Следующий экран: Опросник (в разработке)')));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              ),
                              child: Text('СОХРАНИТЬ', style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Следующий экран: Опросник (в разработке)')));
                              },
                              child: const Text(
                                'Позже',
                                style: TextStyle(
                                  fontFamily: 'PTRootUI',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF7ADAF),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFF7ADAF),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
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

  Widget _buildToggleItem({required String title, required String subtitle, required bool value, required ValueChanged<bool> onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.bold, color: const Color(0xFF3B2121)),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.manrope(fontSize: 13, color: const Color(0xFF8A7370)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFFF7A70),
        ),
      ],
    );
  }
}
