import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../data/models/player.dart';

class CareerTimeline extends StatelessWidget {
  final List<CareerEntry> careerHistory;

  const CareerTimeline({super.key, required this.careerHistory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.timeline, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text('Career History', style: AppTextStyles.headlineMedium),
          ],
        ),
        const SizedBox(height: 16),
        ...List.generate(careerHistory.length, (index) {
          final entry = careerHistory[index];
          final isLast = index == careerHistory.length - 1;
          return _TimelineEntry(
            entry: entry,
            isLast: isLast,
            index: index,
          );
        }),
      ],
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final CareerEntry entry;
  final bool isLast;
  final int index;

  const _TimelineEntry({
    required this.entry,
    required this.isLast,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? AppColors.primary
                        : AppColors.surfaceLight,
                    border: Border.all(
                      color: index == 0 ? AppColors.primary : AppColors.border,
                      width: 2,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.border,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: index == 0
                    ? AppColors.primary.withValues(alpha: 0.08)
                    : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: index == 0
                      ? AppColors.primary.withValues(alpha: 0.2)
                      : AppColors.border,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          entry.club,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: index == 0
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        entry.period,
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (entry.league == 'Unknown' && entry.country == 'Unknown')
                    Text(
                      'First Team Squad',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                    )
                  else if (entry.league == 'Unknown')
                    Text(
                      entry.country,
                      style: AppTextStyles.bodySmall,
                    )
                  else if (entry.country == 'Unknown')
                    Text(
                      entry.league,
                      style: AppTextStyles.bodySmall,
                    )
                  else
                    Text(
                      '${entry.league} • ${entry.country}',
                      style: AppTextStyles.bodySmall,
                    ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _MiniStat(
                          label: 'Apps', value: entry.appearances.toString()),
                      const SizedBox(width: 16),
                      _MiniStat(
                          label: 'Goals',
                          value: entry.goals.toString(),
                          color: AppColors.primary),
                      const SizedBox(width: 16),
                      _MiniStat(
                          label: 'Assists',
                          value: entry.assists.toString(),
                          color: AppColors.accent),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _MiniStat({
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppTextStyles.labelLarge.copyWith(
            color: color ?? AppColors.textPrimary,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
