// lib/features/onboarding/screens/harmoniq_onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmoniq/core/services/app_background.dart';
import 'package:harmoniq/features/onboarding/widget/harmoniq_onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HarmoniqOnboardingScreen extends ConsumerStatefulWidget {
  const HarmoniqOnboardingScreen({super.key});

  @override
  ConsumerState<HarmoniqOnboardingScreen> createState() =>
      _HarmoniqOnboardingScreenState();
}

class _HarmoniqOnboardingScreenState
    extends ConsumerState<HarmoniqOnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<HarmoniqOnboardPage> _pages = [
    const HarmoniqOnboardPage(
      title: 'Welcome to Harmoniq',
      description: 'Your journey to a harmonious life begins here.',
      imageAsset: 'assets/images/onboarding_1.png',
      buttonText: 'Next',
    ),
    const HarmoniqOnboardPage(
      title: 'Discover New Features',
      description: 'Explore the latest features designed for you.',
      imageAsset: 'assets/images/onboarding_2.png',
      buttonText: 'Next',
    ),
    const HarmoniqOnboardPage(
      title: 'Stay Connected',
      description: 'Connect with your friends and family effortlessly.',
      imageAsset: 'assets/images/onboarding_3.png',
      buttonText: 'Get Started',
    ),
  ];

  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _pages.length,
                itemBuilder: (_, index) {
                  final page = _pages[index];
                  return HarmoniqOnboard(page: page, onNext: _onNext);
                },
              ),
            ),
            const SizedBox(height: 24),
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
                activeDotColor: Colors.white,
                dotColor: Colors.white24,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
