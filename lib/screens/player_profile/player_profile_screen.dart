import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/providers.dart';
import '../../widgets/ai_score_indicator.dart';
import '../../widgets/availability_badge.dart';
import '../../widgets/stat_badge.dart';
import '../../widgets/career_timeline.dart';
import '../../widgets/why_this_player.dart';

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
                  Text('Player not found',
                      style: AppTextStyles.headlineMedium),
                ],
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              // ── Hero Header ──
              SliverAppBar(
                expandedHeight: isWide ? 360 : 300,
                pinned: true,
                backgroundColor: AppColors.surface,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new,
                        size: 18, color: AppColors.textPrimary),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.background.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined,
                          size: 18, color: AppColors.textPrimary),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: AppColors.background.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline,
                          size: 18, color: AppColors.textPrimary),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: player.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: AppColors.surfaceLight,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.surfaceLight,
                          child: const Icon(Icons.person,
                              size: 80, color: AppColors.textMuted),
                        ),
                      ),
                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.background.withValues(alpha: 0.3),
                              AppColors.background.withValues(alpha: 0.9),
                              AppColors.background,
                            ],
                            stops: const [0.0, 0.4, 0.7, 1.0],
                          ),
                        ),
                      ),
                      // Player name & position at bottom
                      Positioned(
                        bottom: 16,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    player.position,
                                    style: AppTextStyles.labelMedium.copyWith(
                                      color: AppColors.background,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                AvailabilityBadge(
                                  availability: player.availability,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              player.name,
                              style: AppTextStyles.displayMedium.copyWith(
                                shadows: [
                                  Shadow(
                                    blurRadius: 12,
                                    color:
                                        Colors.black.withValues(alpha: 0.5),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  player.flagEmoji,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  player.nationality,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(Icons.sports_soccer,
                                    size: 16, color: AppColors.textMuted),
                                const SizedBox(width: 4),
                                Text(
                                  player.currentClub,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Content ──
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
              _buildPlayerInfoGrid(player),
              const SizedBox(height: 24),
              _buildBiographySection(player),
              const SizedBox(height: 24),
              _buildStatsSection(player),
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
        _buildPlayerInfoGrid(player),
        const SizedBox(height: 24),
        _buildAiScoreCard(player),
        const SizedBox(height: 24),
        _buildBiographySection(player),
        const SizedBox(height: 24),
        _buildStatsSection(player),
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

  Widget _buildPlayerInfoGrid(dynamic player) {
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
          _InfoItem(label: 'Age', value: '${player.age} years', icon: Icons.calendar_today),
          _InfoItem(label: 'Height', value: player.heightFormatted, icon: Icons.height),
          _InfoItem(label: 'Preferred Foot', value: player.preferredFoot, icon: Icons.directions_run),
          _InfoItem(label: 'Market Value', value: player.marketValueFormatted, icon: Icons.attach_money),
          _InfoItem(label: 'Nationality', value: '${player.flagEmoji} ${player.nationality}', icon: Icons.flag),
          _InfoItem(label: 'Current Club', value: player.currentClub, icon: Icons.shield_outlined),
        ],
      ),
    );
  }

  Widget _buildBiographySection(dynamic player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person_outline, color: AppColors.primary, size: 20),
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
            style: AppTextStyles.bodyLarge.copyWith(
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(dynamic player) {
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
              const Icon(Icons.auto_awesome,
                  color: AppColors.accent, size: 20),
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
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryMuted.withValues(alpha: 0.3),
                AppColors.surfaceLight,
              ],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.primary,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${player.name} — Best Moments',
                      style: AppTextStyles.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Season 2024/25 Highlights',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
              // Duration badge
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
