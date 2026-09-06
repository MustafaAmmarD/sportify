import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/providers.dart';

import 'widgets/scouting_filters_card.dart';
import 'widgets/animated_result_card.dart';

class ScoutingScreen extends ConsumerStatefulWidget {
  const ScoutingScreen({super.key});

  @override
  ConsumerState<ScoutingScreen> createState() => _ScoutingScreenState();
}

class _ScoutingScreenState extends ConsumerState<ScoutingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  bool _showResults = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _runSearch() {
    setState(() {
      _showResults = true;
    });
    ref.read(hasSearchedProvider.notifier).searched();
    _animController.forward(from: 0);
  }

  void _resetSearch() {
    ref.read(scoutingFilterProvider.notifier).reset();
    setState(() {
      _showResults = false;
    });
    ref.read(hasSearchedProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(scoutingResultsProvider);
    final hasSearched = ref.watch(hasSearchedProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 800;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── Header ──
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 72,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.radar,
                    color: AppColors.background,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('AI Club Scouting',
                        style: AppTextStyles.headlineMedium),
                    Text('Find your perfect player',
                        style: AppTextStyles.bodySmall),
                  ],
                ),
              ],
            ),
          ),

          // ── Filters Section ──
          ScoutingFiltersCard(
            onSearch: _runSearch,
            onReset: _resetSearch,
            isWide: isWide,
            screenWidth: screenWidth,
          ),

          // ── Results Section ──
          if (_showResults && hasSearched) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? screenWidth * 0.1 : 20,
                ).copyWith(top: 24, bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('Ranked Results', style: AppTextStyles.headlineMedium),
                    const Spacer(),
                    results.when(
                      data: (players) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${players.length} ${players.length == 1 ? 'match' : 'matches'}',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      loading: () => const SizedBox(),
                      error: (_, __) => const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
            results.when(
              data: (players) {
                if (players.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isWide ? screenWidth * 0.1 : 20,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.search_off,
                                size: 56, color: AppColors.textMuted),
                            const SizedBox(height: 16),
                            Text('No players found',
                                style: AppTextStyles.headlineSmall),
                            const SizedBox(height: 8),
                            Text('Try adjusting your scouting criteria',
                                style: AppTextStyles.bodyMedium),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? screenWidth * 0.1 : 20,
                  ).copyWith(bottom: 100),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final player = players[index];
                        final rank = index + 1;
                        return AnimatedResultCard(
                          player: player,
                          rank: rank,
                          delay: Duration(milliseconds: 100 * index),
                          onTap: () {
                            context.push('/player/${player.id}');
                          },
                        );
                      },
                      childCount: players.length,
                    ),
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(color: AppColors.primary),
                        SizedBox(height: 16),
                        Text('Analyzing players...'),
                      ],
                    ),
                  ),
                ),
              ),
              error: (e, _) => SliverToBoxAdapter(
                child: Center(
                  child: Text('Error: $e', style: AppTextStyles.bodyMedium),
                ),
              ),
            ),
          ],

          // Empty state when no search yet
          if (!_showResults || !hasSearched)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Icon(
                      Icons.radar,
                      size: 64,
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Set your criteria and find the perfect player',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textMuted,
                      ),
                      textAlign: TextAlign.center,
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
