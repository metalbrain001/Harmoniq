// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:harmoniq/core/theme/app_colors.dart';
// import 'package:harmoniq/core/utils/widgets/check_box.dart';

// class TermsAndCondition extends StatelessWidget {
//   final String text;
//   final String linkText;
//   final VoidCallback onLinkTap;
//   final bool showCheckbox;
//   final bool isChecked;
//   final bool isError;
//   final ValueChanged<bool?> onChanged;
//   final VoidCallback onTermsTap;
//   final VoidCallback onPrivacyTap;
//   final VoidCallback onDataUsageTap;

//   const TermsAndCondition({
//     super.key,
//     required this.text,
//     required this.linkText,
//     required this.onLinkTap,
//     this.showCheckbox = true,
//     this.isChecked = false,
//     this.isError = false,
//     required this.onChanged,
//     required this.onTermsTap,
//     required this.onPrivacyTap,
//     required this.onDataUsageTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (showCheckbox)
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomCheckbox(
//                 initialValue: isChecked,
//                 isError: isError,
//                 isDisabled: false,
//                 onChanged: onChanged,
//               ),
//               const SizedBox(width: 12),
//               Expanded(child: _buildText(context)),
//             ],
//           )
//         else
//           _buildText(context),
//         const SizedBox(height: 24),
//         const Divider(
//           color: AppColors.appBarBackground,
//           height: 1,
//           thickness: 1,
//         ),
//       ],
//     );
//   }

//   Widget _buildText(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         text: text,
//         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//           fontFamily: 'SFCompact',
//           color: AppColors.onboardingText,
//         ),
//         children: [
//           TextSpan(
//             text: linkText,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//               fontFamily: 'SFCompact',
//               color: AppColors.checkBoxTerms,
//               fontWeight: FontWeight.bold,
//             ),
//             recognizer: TapGestureRecognizer()..onTap = onLinkTap,
//           ),
//         ],
//       ),
//       key: const Key('terms_and_conditions_text'),
//       textAlign: TextAlign.start,
//       softWrap: true,
//       maxLines: 3,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
// }
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:harmoniq/core/theme/app_colors.dart';
import 'package:harmoniq/core/utils/widgets/check_box.dart';

class TermsAndCondition extends StatelessWidget {
  final bool showCheckbox;
  final bool isChecked;
  final bool isError;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;
  final VoidCallback onDataUsageTap;

  const TermsAndCondition({
    super.key,
    required this.showCheckbox,
    required this.isChecked,
    required this.isError,
    required this.onChanged,
    required this.onTermsTap,
    required this.onPrivacyTap,
    required this.onDataUsageTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontFamily: 'SFCompact',
      color: AppColors.onboardingText,
    );

    final linkStyle = baseStyle?.copyWith(
      color: AppColors.checkBoxTerms,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showCheckbox)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckbox(
                initialValue: isChecked,
                isError: isError,
                isDisabled: false,
                onChanged: onChanged,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "By using Harmoniq, you agree to our ",
                    style: baseStyle,
                    children: [
                      TextSpan(
                        text: "Terms & Conditions",
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                      ),
                      const TextSpan(text: ", "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: linkStyle,
                        recognizer:
                            TapGestureRecognizer()..onTap = onPrivacyTap,
                      ),
                      const TextSpan(text: ", and "),
                      TextSpan(
                        text: "how we use your data.",
                        style: linkStyle,
                        recognizer:
                            TapGestureRecognizer()..onTap = onDataUsageTap,
                      ),
                    ],
                  ),
                  key: const Key('terms_privacy_data_text'),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              ),
            ],
          )
        else
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text.rich(
              TextSpan(
                text: "By using Harmoniq, you agree to our ",
                style: baseStyle,
                children: [
                  TextSpan(
                    text: "Terms & Conditions",
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                  ),
                  const TextSpan(text: ", "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
                  ),
                  const TextSpan(text: ", and "),
                  TextSpan(
                    text: "how we use your data.",
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()..onTap = onDataUsageTap,
                  ),
                ],
              ),
              textAlign: TextAlign.start,
              softWrap: true,
            ),
          ),
        const SizedBox(height: 24),
        const Divider(
          color: AppColors.appBarBackground,
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
