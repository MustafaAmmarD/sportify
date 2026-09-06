import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/providers.dart';
import '../../widgets/ai_score_indicator.dart';
import '../../widgets/career_timeline.dart';
import '../../widgets/why_this_player.dart';
import '../../widgets/app_image.dart';

import 'widgets/profile_hero_header.dart';
import 'widgets/player_info_grid.dart';
import 'widgets/career_stats_section.dart';

class PlayerProfileScreen extends ConsumerWidget {
  final String playerId;

  const PlayerProfileScreen({super.key, required this.playerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerDetailProvider(playerId));
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 800;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: playerAsync.when(
        data: (player) {
          if (player == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person_off,
                      size: 64, color: AppColors.textMuted),
                  const SizedBox(height: 16),
                  Text('Player not found', style: AppTextStyles.headlineMedium),
                ],
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              ProfileHeroHeader(player: player, isWide: isWide),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? screenWidth * 0.1 : 20,
                    vertical: 20,
                  ),
                  child: isWide
                      ? _buildWideLayout(context, player)
                      : _buildNarrowLayout(context, player),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline,
                  size: 48, color: AppColors.unavailable),
              const SizedBox(height: 16),
              Text('Failed to load player', style: AppTextStyles.headlineSmall),
              const SizedBox(height: 8),
              Text(e.toString(), style: AppTextStyles.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context, dynamic player) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column — main info
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlayerInfoGrid(player: player),
              const SizedBox(height: 24),
              _buildBiographySection(player),
              const SizedBox(height: 24),
              CareerStatsSection(player: player),
              const SizedBox(height: 24),
              CareerTimeline(careerHistory: player.careerHistory),
              const SizedBox(height: 24),
              _buildHighlightSection(player),
            ],
          ),
        ),
        const SizedBox(width: 32),
        // Right column — AI score
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildAiScoreCard(player),
              const SizedBox(height: 24),
              WhyThisPlayer(player: player),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context, dynamic player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlayerInfoGrid(player: player),
        const SizedBox(height: 24),
        _buildAiScoreCard(player),
        const SizedBox(height: 24),
        _buildBiographySection(player),
        const SizedBox(height: 24),
        CareerStatsSection(player: player),
        const SizedBox(height: 24),
        CareerTimeline(careerHistory: player.careerHistory),
        const SizedBox(height: 24),
        _buildHighlightSection(player),
        const SizedBox(height: 24),
        WhyThisPlayer(player: player),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildBiographySection(dynamic player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person_outline,
                color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text('Biography', style: AppTextStyles.headlineMedium),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            player.biography,
            style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
          ),
        ),
      ],
    );
  }

  Widget _buildAiScoreCard(dynamic player) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.08),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Text(
                'AI Fit Score',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AiScoreIndicator(
            score: player.aiFitScore,
            size: 120,
            showLabel: false,
          ),
          const SizedBox(height: 16),
          Text(
            _getScoreDescription(player.aiFitScore),
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightSection(dynamic player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.play_circle_outline,
                color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text('Highlight Video', style: AppTextStyles.headlineMedium),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Video playback is a placeholder for this prototype'),
                backgroundColor: AppColors.surfaceLight,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: AppImage(imageUrl: player.imageUrl),
                  ),
                  // Dark overlay for contrast
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.black87,
                            size: 36,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${player.name} — Best Moments',
                          style: AppTextStyles.labelLarge.copyWith(
                            color: Colors.white,
                            shadows: [
                              const Shadow(
                                blurRadius: 4,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Season 2024/25 Highlights',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white70,
                            shadows: [
                              const Shadow(
                                blurRadius: 4,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '4:32',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
    );
  }

  String _getScoreDescription(double score) {
    if (score >= 0.90) return 'Exceptional match — highly recommended';
    if (score >= 0.80) return 'Strong match — fits your requirements well';
    if (score >= 0.70) return 'Good match — meets most criteria';
    return 'Moderate match — some gaps identified';
  }
}
