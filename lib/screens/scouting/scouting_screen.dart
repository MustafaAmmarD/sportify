import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/player.dart';
import '../../providers/providers.dart';
import '../../widgets/ai_score_indicator.dart';

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

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(scoutingFilterProvider);
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
                    Text(
                      'AI Club Scouting',
                      style: AppTextStyles.headlineMedium,
                    ),
                    Text(
                      'Find your perfect player',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Filters Section ──
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? screenWidth * 0.1 : 20,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section title
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
                          'Scouting Criteria',
                          style: AppTextStyles.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ── Position Selector ──
                    Text(
                      'POSITION',
                      style: AppTextStyles.statLabel,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildPositionChip('All', null, filter.position),
                        ...AppConstants.positions.map((pos) =>
                            _buildPositionChip(pos, pos, filter.position)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── Age Range ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('AGE RANGE', style: AppTextStyles.statLabel),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${filter.minAge.toInt()} - ${filter.maxAge.toInt()} years',
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RangeSlider(
                      values: RangeValues(filter.minAge, filter.maxAge),
                      min: 16,
                      max: 40,
                      divisions: 24,
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.surfaceLight,
                      onChanged: (values) {
                        ref.read(scoutingFilterProvider.notifier).setAgeRange(
                              values.start,
                              values.end,
                            );
                      },
                    ),
                    const SizedBox(height: 20),

                    // ── Preferred Foot ──
                    Text('PREFERRED FOOT', style: AppTextStyles.statLabel),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildFootChip('Any', null, filter.preferredFoot),
                        const SizedBox(width: 8),
                        ...AppConstants.preferredFoot.map((foot) =>
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _buildFootChip(
                                  foot, foot, filter.preferredFoot),
                            )),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── Budget ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('MAX BUDGET', style: AppTextStyles.statLabel),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '€${filter.maxBudget.toInt()}M',
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Slider(
                      value: filter.maxBudget,
                      min: 1,
                      max: 100,
                      divisions: 99,
                      activeColor: AppColors.accent,
                      inactiveColor: AppColors.surfaceLight,
                      onChanged: (value) {
                        ref
                            .read(scoutingFilterProvider.notifier)
                            .setBudget(value);
                      },
                    ),
                    const SizedBox(height: 24),

                    // ── Search Button ──
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _runSearch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.radar, size: 20),
                            const SizedBox(width: 10),
                            Text(
                              'Find Players',
                              style: AppTextStyles.buttonText.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Reset button
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          ref.read(scoutingFilterProvider.notifier).reset();
                          setState(() {
                            _showResults = false;
                          });
                          ref.read(hasSearchedProvider.notifier).reset();
                        },
                        child: Text(
                          'Reset Filters',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    Text(
                      'Ranked Results',
                      style: AppTextStyles.headlineMedium,
                    ),
                    const Spacer(),
                    results.when(
                      data: (players) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
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
                            const Icon(
                              Icons.search_off,
                              size: 56,
                              color: AppColors.textMuted,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No players found',
                              style: AppTextStyles.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Try adjusting your scouting criteria',
                              style: AppTextStyles.bodyMedium,
                            ),
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
                        return _AnimatedResultCard(
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
                  child: Text('Error: $e',
                      style: AppTextStyles.bodyMedium),
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

  Widget _buildPositionChip(
      String label, String? value, String? selected) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () {
        ref.read(scoutingFilterProvider.notifier).setPosition(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.2)
              : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFootChip(
      String label, String? value, String? selected) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () {
        ref.read(scoutingFilterProvider.notifier).setPreferredFoot(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.2)
              : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ── Animated Result Card ──
class _AnimatedResultCard extends StatefulWidget {
  final Player player;
  final int rank;
  final Duration delay;
  final VoidCallback onTap;

  const _AnimatedResultCard({
    required this.player,
    required this.rank,
    required this.delay,
    required this.onTap,
  });

  @override
  State<_AnimatedResultCard> createState() => _AnimatedResultCardState();
}

class _AnimatedResultCardState extends State<_AnimatedResultCard>
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
                    child: CachedNetworkImage(
                      imageUrl: widget.player.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                        width: 50,
                        height: 50,
                        color: AppColors.surfaceLight,
                      ),
                      errorWidget: (_, __, ___) => Container(
                        width: 50,
                        height: 50,
                        color: AppColors.surfaceLight,
                        child: const Icon(Icons.person,
                            size: 24, color: AppColors.textMuted),
                      ),
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
                              style:
                                  AppTextStyles.bodySmall.copyWith(fontSize: 12),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${widget.player.age}y',
                              style:
                                  AppTextStyles.bodySmall.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              widget.player.currentClub,
                              style:
                                  AppTextStyles.bodySmall.copyWith(fontSize: 11),
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
