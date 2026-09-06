import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../providers/providers.dart';

class ScoutingFiltersCard extends ConsumerWidget {
  final VoidCallback onSearch;
  final VoidCallback onReset;
  final bool isWide;
  final double screenWidth;

  const ScoutingFiltersCard({
    super.key,
    required this.onSearch,
    required this.onReset,
    required this.isWide,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scoutingFilterProvider);

    return SliverToBoxAdapter(
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
              Text('POSITION', style: AppTextStyles.statLabel),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildPositionChip('All', null, filter.position, ref),
                  ...AppConstants.positions.map((pos) =>
                      _buildPositionChip(pos, pos, filter.position, ref)),
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
                        horizontal: 10, vertical: 4),
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
                  _buildFootChip('Any', null, filter.preferredFoot, ref),
                  const SizedBox(width: 8),
                  ...AppConstants.preferredFoot.map((foot) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _buildFootChip(
                            foot, foot, filter.preferredFoot, ref),
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
                        horizontal: 10, vertical: 4),
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
                  ref.read(scoutingFilterProvider.notifier).setBudget(value);
                },
              ),
              const SizedBox(height: 24),

              // ── Search Button ──
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onSearch,
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
                  onPressed: onReset,
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
    );
  }

  Widget _buildPositionChip(
      String label, String? value, String? selected, WidgetRef ref) {
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

  Widget _buildFootChip(
      String label, String? value, String? selected, WidgetRef ref) {
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
