import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class AvailabilityBadge extends StatelessWidget {
  final String availability;
  final bool compact;

  const AvailabilityBadge({
    super.key,
    required this.availability,
    this.compact = false,
  });

  Color get _color {
    switch (availability) {
      case 'Available Now':
        return AppColors.available;
      case 'Free Agent':
        return AppColors.available;
      case 'On Loan':
        return AppColors.onLoan;
      case 'In Negotiation':
        return AppColors.negotiating;
      case 'On Contract':
        return AppColors.textMuted;
      default:
        return AppColors.textMuted;
    }
  }

  IconData get _icon {
    switch (availability) {
      case 'Available Now':
        return Icons.check_circle_outline;
      case 'Free Agent':
        return Icons.person_outline;
      case 'On Loan':
        return Icons.swap_horiz;
      case 'In Negotiation':
        return Icons.handshake_outlined;
      case 'On Contract':
        return Icons.lock_outline;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: _color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: _color.withValues(alpha: 0.3)),
        ),
        child: Text(
          availability,
          style: AppTextStyles.labelSmall.copyWith(
            color: _color,
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, size: 14, color: _color),
          const SizedBox(width: 6),
          Text(
            availability,
            style: AppTextStyles.labelMedium.copyWith(
              color: _color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
