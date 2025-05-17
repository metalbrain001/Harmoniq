// lib/features/onboarding/widgets/harmoniq_onboard.dart
import 'package:flutter/material.dart';
import 'package:harmoniq/core/constants/button_enum.dart';
import 'package:harmoniq/core/widgets/button/common_btn.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/features/onboarding/widget/onboarding_info.dart';
import 'package:harmoniq/helper/logo/harmoniq_logo.dart';

class HarmoniqOnboardPage {
  final String title;
  final String description;
  final String imageAsset;
  final String buttonText;
  final List<OnboardingInfoTile>? infoTiles;
  final bool showInfo = false;

  const HarmoniqOnboardPage({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.buttonText,
    this.infoTiles,
    showInfo = false,
  });
}

class HarmoniqOnboard extends StatefulWidget {
  final HarmoniqOnboardPage page;
  final VoidCallback onNext;

  const HarmoniqOnboard({super.key, required this.page, required this.onNext});

  @override
  State<HarmoniqOnboard> createState() => _HarmoniqOnboardState();
}

class _HarmoniqOnboardState extends State<HarmoniqOnboard>
    with SingleTickerProviderStateMixin {
  bool showInfo = false;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Start animation on load
    _controller.forward().whenComplete(() {
      setState(() => showInfo = true);
    });
  }

  void handleNext() {
    setState(() => showInfo = true);
    _controller.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), widget.onNext);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tiles = widget.page.infoTiles ?? [];
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            key: ValueKey(widget.page.title),
            // padding: const EdgeInsets.symmetric(horizontal: 24.0),
            padding: const EdgeInsets.fromLTRB(24, 140, 24, 24),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ), // spacer to push down content below logo
                  Text(
                    widget.page.title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'SFCompact',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.onboardingText,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// 🔥 Animated Tiles
                  if (tiles.isNotEmpty)
                    Column(
                      children: List.generate(tiles.length, (index) {
                        final tile = tiles[index];
                        final delay = index * 0.1;

                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            final opacity =
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Interval(
                                    delay,
                                    delay + 0.4,
                                    curve: Curves.easeOut,
                                  ),
                                ).value;

                            final offsetY = (1 - opacity) * 20;

                            return Opacity(
                              opacity: showInfo ? opacity : 0,
                              child: Transform.translate(
                                offset: Offset(0, offsetY),
                                child: child,
                              ),
                            );
                          },
                          child: OnboardingInfoTile(
                            title: tile.title,
                            description: tile.description,
                            icon: tile.icon,
                          ),
                        );
                      }),
                    ),

                  const SizedBox(height: 34),
                  AppButton(
                    text: widget.page.buttonText,
                    onPressed: handleNext,
                    type: ButtonType.primary,
                    size: ButtonSize.xsmall,
                    backgroundColor: AppColors.buttonBackground,
                    foregroundColor: AppColors.buttonText,
                  ),
                  const SizedBox(height: 34),
                ],
              ),
            ),
          ),

          /// 🧠 Sticky Top Logo (not scrollable)
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: Center(
              child: HarmoniqLogo(key: const Key('onboarding_logo')),
            ),
          ),
        ],
      ),
    );
  }
}
