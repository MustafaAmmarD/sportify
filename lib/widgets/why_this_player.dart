import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../data/models/player.dart';

class WhyThisPlayer extends StatelessWidget {
  final Player player;

  const WhyThisPlayer({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.accent,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why This Player?',
                  style: AppTextStyles.headlineMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  'AI-powered analysis',
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...player.aiFitReasons.map((reason) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ReasonCard(reason: reason),
          );
        }),
      ],
    );
  }
}

class _ReasonCard extends StatelessWidget {
  final AiFitReason reason;

  const _ReasonCard({required this.reason});

  IconData get _icon {
    switch (reason.category) {
      case 'Position Match':
        return Icons.pin_drop_outlined;
      case 'Tactical Fit':
        return Icons.schema_outlined;
      case 'Performance':
        return Icons.trending_up;
      case 'Availability':
        return Icons.event_available;
      case 'Age Profile':
        return Icons.calendar_today;
      case 'Market Value':
        return Icons.attach_money;
      case 'Growth Potential':
        return Icons.rocket_launch;
      case 'League Experience':
        return Icons.emoji_events;
      default:
        return Icons.analytics;
    }
  }

  Color _getScoreColor(double score) {
    if (score >= 0.85) return AppColors.primary;
    if (score >= 0.70) return AppColors.accent;
    return AppColors.negotiating;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getScoreColor(reason.score);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(_icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reason.category,
                      style: AppTextStyles.labelLarge.copyWith(fontSize: 13),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${(reason.score * 100).toInt()}%',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: color,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  reason.description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                // Progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: reason.score,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 4,
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
