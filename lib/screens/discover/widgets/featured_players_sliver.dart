import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/featured_player_card.dart';

class FeaturedPlayersSliver extends ConsumerWidget {
  const FeaturedPlayersSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredPlayers = ref.watch(featuredPlayersProvider);

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
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
                      'Featured Players',
                      style: AppTextStyles.headlineMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 260,
            child: featuredPlayers.when(
              data: (players) => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return FeaturedPlayerCard(
                    player: players[index],
                    onTap: () {
                      context.push('/player/${players[index].id}');
                    },
                  );
                },
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (e, _) => Center(
                child: Text('Error loading featured players',
                    style: AppTextStyles.bodyMedium),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
