import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../providers/providers.dart';
import '../../widgets/sportify_logo.dart';
import '../../widgets/player_card.dart';

import 'widgets/search_bar_sliver.dart';
import 'widgets/featured_players_sliver.dart';
import 'widgets/highlight_reels_sliver.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allPlayers = ref.watch(searchResultsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;
    final isMedium = screenWidth > 600;

    int crossAxisCount = 2;
    if (isWide) {
      crossAxisCount = 4;
    } else if (isMedium) {
      crossAxisCount = 3;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── App Bar with branding ──
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: AppColors.background,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 72,
            title: const SportifyLogo(fontSize: 24, showTagline: false),
          ),

          // ── Search Bar ──
          const SearchBarSliver(),

          // Show search results if searching
          if (searchQuery.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Text(
                  'Search results for "$searchQuery"',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ),
          ],

          // ── Featured & Highlights ──
          if (searchQuery.isEmpty) ...[
            const FeaturedPlayersSliver(),
            const HighlightReelsSliver(),

            // ── All Players Section Header ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Discover Talent',
                          style: AppTextStyles.headlineMedium,
                        ),
                      ],
                    ),
                    Text(
                      allPlayers.when(
                        data: (p) => '${p.length} players',
                        loading: () => '...',
                        error: (_, __) => '',
                      ),
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],

          // ── Player Grid ──
          allPlayers.when(
            data: (players) {
              if (players.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.search_off, size: 64, color: AppColors.textMuted),
                        const SizedBox(height: 16),
                        Text(
                          'No players found',
                          style: AppTextStyles.headlineMedium.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your search criteria.',
                          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return PlayerCard(
                        player: players[index],
                        onTap: () {
                          context.push('/player/${players[index].id}');
                        },
                      );
                    },
                    childCount: players.length,
                  ),
                ),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
            error: (e, _) => SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        color: AppColors.unavailable, size: 48),
                    const SizedBox(height: 16),
                    Text('Failed to load players',
                        style: AppTextStyles.headlineSmall),
                    const SizedBox(height: 8),
                    Text(e.toString(), style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
