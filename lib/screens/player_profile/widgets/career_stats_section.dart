import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../widgets/stat_badge.dart';

class CareerStatsSection extends StatelessWidget {
  final dynamic player;

  const CareerStatsSection({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.bar_chart, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text('Career Statistics', style: AppTextStyles.headlineMedium),
          ],
        ),
        const SizedBox(height: 12),
        StatRow(
          stats: [
            StatItem(
              label: 'Appearances',
              value: player.stats.totalAppearances.toString(),
            ),
            StatItem(
              label: 'Goals',
              value: player.stats.totalGoals.toString(),
              valueColor: AppColors.primary,
            ),
            StatItem(
              label: 'Assists',
              value: player.stats.totalAssists.toString(),
              valueColor: AppColors.accent,
            ),
          ],
        ),
        const SizedBox(height: 12),
        StatRow(
          stats: [
            if (player.stats.cleanSheets > 0)
              StatItem(
                label: 'Clean Sheets',
                value: player.stats.cleanSheets.toString(),
              ),
            StatItem(
              label: 'Pass Acc.',
              value: '${player.stats.passAccuracy.toStringAsFixed(1)}%',
            ),
            StatItem(
              label: 'Yellow Cards',
              value: player.stats.yellowCards.toString(),
              valueColor: AppColors.accent,
            ),
          ],
        ),
      ],
    );
  }
}
