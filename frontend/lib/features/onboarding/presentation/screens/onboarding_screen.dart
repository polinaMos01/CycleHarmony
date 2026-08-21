import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Таро дня и\nсоветы от Ангела',
      'subtitle': 'Получайте ежедневные предсказания, мудрые советы Ангелов и вдохновляющие послания, настроенные под вашу фазу цикла.',
      'button': 'ОТКРЫТЬ КАРТУ'
    },
    {
      'title': 'Дневник\nсамочувствия',
      'subtitle': 'Отслеживайте симптомы, настроение и самочувствие каждый день. Получайте персональные AI-инсайты.',
      'button': 'НАЧАТЬ ОТСЛЕЖИВАНИЕ'
    },
    {
      'title': 'Гармония\nначинается с тебя',
      'subtitle': 'Отслеживайте цикл, настроение, здоровье — и получайте персональные рекомендации от ИИ.',
      'button': 'НАЧАТЬ'
    },
    {
      'title': 'Вместе\nна одной волне',
      'subtitle': 'Синхронизируйте настроение и циклы с партнёром для лучшего взаимопонимания.',
      'button': 'ДАЛЕЕ'
    },
    {
      'title': 'Синхронизация\nс партнёром',
      'subtitle': 'Поделитесь своим настроением, биоритмами и важными периодами с вашим любимым человеком.',
      'button': 'ПОДКЛЮЧИТЬ ПАРТНЕРА'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient matching Figma
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFCF3EE), // Soft peach top
                  Color(0xFFF9E8E2), // Slightly darker bottom
                ],
              ),
            ),
          ),
          // Here we can place the exact illustration for each page once identified
          // Positioned.fill(child: Image.asset('assets/images/...', fit: BoxFit.cover)),
          
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60), // Top margin like in Figma
                            Text(
                              _pages[index]['title']!,
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              _pages[index]['subtitle']!,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56, // Button height matching Figma
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _pages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              context.push('/questionnaire_calendar');
                            }
                          },
                          child: Text(
                            _pages[_currentPage]['button']!,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 6,
                            width: _currentPage == index ? 24 : 6,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
