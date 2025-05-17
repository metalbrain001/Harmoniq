// Social logins icon widget
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmoniq/core/theme/app_colors.dart';

class SocialLoginsIcon extends StatelessWidget {
  final String svgPath;
  final double width;
  final double height;
  final Color? color;
  final double size;
  final Gradient? gradient;
  final VoidCallback onTap;

  const SocialLoginsIcon({
    super.key,
    required this.svgPath,
    this.width = 28,
    this.height = 28,
    this.color,
    this.size = 28,
    this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final widget = SvgPicture.asset(
      svgPath,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: BoxFit.cover,
      key: const Key('social_logins_icon'),
    );

    final Widget wrappedIcon = Container(
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(maxWidth: size, maxHeight: size),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        color: color ?? AppColors.white,
      ),
      child:
          gradient != null
              ? widget
              : Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color ?? AppColors.white,
                ),
                child: widget,
              ),
    );
    return InkWell(onTap: onTap, child: wrappedIcon);
  }
}
