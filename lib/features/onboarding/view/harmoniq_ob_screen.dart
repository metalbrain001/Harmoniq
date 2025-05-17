// lib/features/onboarding/screens/harmoniq_onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:harmoniq/core/services/app_background.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/features/onboarding/widget/harmoniq_onboarding.dart';
import 'package:harmoniq/features/onboarding/widget/onboarding_info.dart';
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
      title: 'Harmoniq helps you connect, explore, and belong — instantly.',
      description:
          'Harmoniq helps you connect, explore, and belong — instantly.',
      imageAsset: 'assets/icons/icon.png',
      buttonText: 'Next',
      infoTiles: [
        OnboardingInfoTile(
          title: 'Connect Instantly',
          description:
              'Chat and match with like-minded people nearby or worldwide.',
          icon: Icons.message_outlined,
        ),
        OnboardingInfoTile(
          title: 'Explore Cultures',
          description:
              'Dive into global stories, perspectives, and traditions.',
          icon: Icons.explore_outlined,
        ),
        OnboardingInfoTile(
          title: 'Safe & Private',
          description: 'Built with privacy and security at the core.',
          icon: Icons.lock_outline,
        ),
        OnboardingInfoTile(
          title: 'Join the Community',
          description: 'Become part of a growing, inclusive community.',
          icon: Icons.group_outlined,
        ),
      ],
    ),
    const HarmoniqOnboardPage(
      title: 'Instant Messaging',
      description: 'Enjoy secure and private conversations.',
      imageAsset: 'assets/images/instant.png',
      buttonText: 'Next',
      infoTiles: [
        OnboardingInfoTile(
          title: 'Real-time Chat',
          description: 'Stay connected with instant messaging.',
          icon: Icons.chat_bubble_outline,
        ),
        OnboardingInfoTile(
          title: 'Voice & Video Calls',
          description: 'Connect face-to-face with voice and video calls.',
          icon: Icons.video_call_outlined,
        ),
        OnboardingInfoTile(
          title: 'Group Chats',
          description: 'Create groups to chat with multiple friends.',
          icon: Icons.group_outlined,
        ),
      ],
    ),
    const HarmoniqOnboardPage(
      title: 'Stay Connected',
      description: 'Meet people all over the world.',
      imageAsset: 'assets/images/harmony.png',
      buttonText: 'Get Started',
      infoTiles: [
        OnboardingInfoTile(
          title: 'Global Community',
          description: 'Connect with people from different cultures.',
          icon: Icons.public_outlined,
        ),
        OnboardingInfoTile(
          title: 'Share Experiences',
          description: 'Share your experiences and learn from others.',
          icon: Icons.share_outlined,
        ),
        OnboardingInfoTile(
          title: 'Join Events',
          description: 'Participate in events and meet new friends.',
          icon: Icons.event_outlined,
        ),
      ],
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
      // Navigate to the login screen
      context.goNamed('welcome');
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
            // Skip button
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
            // Skip button
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => context.goNamed('welcome'),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
