import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class SportifyLogo extends StatelessWidget {
  final double fontSize;
  final bool showTagline;

  const SportifyLogo({
    super.key,
    this.fontSize = 28,
    this.showTagline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: fontSize * 1.2,
              height: fontSize * 1.2,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(fontSize * 0.3),
              ),
              child: Icon(
                Icons.sports_soccer,
                color: AppColors.background,
                size: fontSize * 0.7,
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sport',
                    style: AppTextStyles.displaySmall.copyWith(
                      fontSize: fontSize,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'ify',
                    style: AppTextStyles.displaySmall.copyWith(
                      fontSize: fontSize,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (showTagline) ...[
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              'AI-Powered Football Talent Discovery',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
