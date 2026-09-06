import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PlayerInfoGrid extends StatelessWidget {
  final dynamic player;

  const PlayerInfoGrid({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Wrap(
        spacing: 24,
        runSpacing: 16,
        children: [
          _InfoItem(
              label: 'Age',
              value: '${player.age} years',
              icon: Icons.calendar_today),
          _InfoItem(
              label: 'Height',
              value: player.heightFormatted,
              icon: Icons.height),
          _InfoItem(
              label: 'Preferred Foot',
              value: player.preferredFoot,
              icon: Icons.directions_run),
          _InfoItem(
              label: 'Market Value',
              value: player.marketValueFormatted,
              icon: Icons.attach_money),
          _InfoItem(
              label: 'Nationality',
              value: '${player.flagEmoji} ${player.nationality}',
              icon: Icons.flag),
          _InfoItem(
              label: 'Current Club',
              value: player.currentClub,
              icon: Icons.shield_outlined),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textMuted),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: AppTextStyles.statLabel.copyWith(fontSize: 9),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.labelLarge.copyWith(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
