import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/player_repository.dart';
import '../data/models/player.dart';
import '../data/models/scouting_filter.dart';

// ── Repository Provider ──
final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return MockPlayerRepository();
});

// ── Discover / Home Providers ──
final allPlayersProvider = FutureProvider<List<Player>>((ref) async {
  final repo = ref.watch(playerRepositoryProvider);
  return repo.getAllPlayers();
});

final featuredPlayersProvider = FutureProvider<List<Player>>((ref) async {
  final repo = ref.watch(playerRepositoryProvider);
  return repo.getFeaturedPlayers();
});

// ── Search Provider ──
final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<Player>>((ref) async {
  final repo = ref.watch(playerRepositoryProvider);
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) {
    return repo.getAllPlayers();
  }
  return repo.searchPlayers(query);
});

// ── Player Detail Provider ──
final playerDetailProvider =
    FutureProvider.family<Player?, String>((ref, playerId) async {
  final repo = ref.watch(playerRepositoryProvider);
  return repo.getPlayerById(playerId);
});

// ── Scouting Providers ──
final scoutingFilterProvider = StateNotifierProvider<ScoutingFilterNotifier, ScoutingFilter>((ref) {
  return ScoutingFilterNotifier();
});

class ScoutingFilterNotifier extends StateNotifier<ScoutingFilter> {
  ScoutingFilterNotifier() : super(const ScoutingFilter());

  void setPosition(String? position) {
    state = state.copyWith(position: position);
  }

  void setAgeRange(double min, double max) {
    state = state.copyWith(minAge: min, maxAge: max);
  }

  void setPreferredFoot(String? foot) {
    state = state.copyWith(preferredFoot: foot);
  }

  void setBudget(double budget) {
    state = state.copyWith(maxBudget: budget);
  }

  void reset() {
    state = const ScoutingFilter();
  }
}

final scoutingResultsProvider = FutureProvider<List<Player>>((ref) async {
  final repo = ref.watch(playerRepositoryProvider);
  final filter = ref.watch(scoutingFilterProvider);
  return repo.scoutPlayers(filter);
});

// ── Has the user triggered a scouting search? ──
final hasSearchedProvider = StateProvider<bool>((ref) => false);

// ── Bottom Navigation Index ──
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
