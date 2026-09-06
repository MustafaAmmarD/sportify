import 'package:flutter/material.dart';
import '../../../widgets/app_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../data/models/player.dart';
import '../../../../widgets/ai_score_indicator.dart';

class AnimatedResultCard extends StatefulWidget {
  final Player player;
  final int rank;
  final Duration delay;
  final VoidCallback onTap;

  const AnimatedResultCard({
    super.key,
    required this.player,
    required this.rank,
    required this.delay,
    required this.onTap,
  });

  @override
  State<AnimatedResultCard> createState() => _AnimatedResultCardState();
}

class _AnimatedResultCardState extends State<AnimatedResultCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return AppColors.accent;
      case 2:
        return AppColors.textSecondary;
      case 3:
        return const Color(0xFFCD7F32);
      default:
        return AppColors.textMuted;
    }
  }

  IconData _getRankIcon(int rank) {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.military_tech;
      case 3:
        return Icons.workspace_premium;
      default:
        return Icons.tag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isHovered ? AppColors.cardHover : AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: widget.rank == 1
                      ? AppColors.accent.withValues(alpha: 0.3)
                      : _isHovered
                          ? AppColors.primary.withValues(alpha: 0.3)
                          : AppColors.border,
                ),
                boxShadow: widget.rank == 1
                    ? [
                        BoxShadow(
                          color: AppColors.accent.withValues(alpha: 0.1),
                          blurRadius: 16,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  // Rank indicator
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color:
                          _getRankColor(widget.rank).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getRankColor(widget.rank)
                            .withValues(alpha: 0.3),
                      ),
                    ),
                    child: Center(
                      child: widget.rank <= 3
                          ? Icon(
                              _getRankIcon(widget.rank),
                              color: _getRankColor(widget.rank),
                              size: 22,
                            )
                          : Text(
                              '#${widget.rank}',
                              style: AppTextStyles.labelLarge.copyWith(
                                color: _getRankColor(widget.rank),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Player photo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AppImage(
                      imageUrl: widget.player.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Player info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.player.name,
                          style: AppTextStyles.labelLarge.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.primary.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                widget.player.position,
                                style: AppTextStyles.position
                                    .copyWith(fontSize: 10),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.player.flagEmoji,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.player.nationality,
                              style: AppTextStyles.bodySmall
                                  .copyWith(fontSize: 12),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${widget.player.age}y',
                              style: AppTextStyles.bodySmall
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              widget.player.currentClub,
                              style: AppTextStyles.bodySmall
                                  .copyWith(fontSize: 11),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.player.marketValueFormatted,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.accent,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // AI Score
                  AiScoreIndicator(
                    score: widget.player.aiFitScore,
                    size: 56,
                    showLabel: false,
                    animate: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
