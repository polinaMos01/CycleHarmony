import 'package:flutter/material.dart';

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
      body: SafeArea(
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
                        Text(
                          _pages[index]['title']!,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _pages[index]['subtitle']!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        // Placeholder for illustration image
                        Center(
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(Icons.image, size: 50, color: Colors.black12),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // TODO: Navigate to Auth or Home
                        }
                      },
                      child: Text(_pages[_currentPage]['button']!),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
