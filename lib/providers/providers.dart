import 'dart:async';
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
// Holds the raw typed value (updates instantly — only used by the TextField)
final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(String value) {
    state = value;
  }
}

// Holds the debounced value — updates 400ms after the user stops typing.
// This is what drives the expensive searchResultsProvider rebuild.
final debouncedSearchQueryProvider =
    NotifierProvider<DebouncedSearchNotifier, String>(
  DebouncedSearchNotifier.new,
);

class DebouncedSearchNotifier extends Notifier<String> {
  Timer? _timer;

  @override
  String build() {
    ref.onDispose(() => _timer?.cancel());
    return '';
  }

  void update(String value) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 400), () {
      state = value;
    });
  }
}

final searchResultsProvider = FutureProvider<List<Player>>((ref) async {
  final repo = ref.watch(playerRepositoryProvider);
  final query = ref.watch(debouncedSearchQueryProvider);
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
final scoutingFilterProvider =
    NotifierProvider<ScoutingFilterNotifier, ScoutingFilter>(
  ScoutingFilterNotifier.new,
);

class ScoutingFilterNotifier extends Notifier<ScoutingFilter> {
  @override
  ScoutingFilter build() => const ScoutingFilter();

  void setPosition(String? position) {
    state = ScoutingFilter(
      position: position,
      minAge: state.minAge,
      maxAge: state.maxAge,
      preferredFoot: state.preferredFoot,
      maxBudget: state.maxBudget,
    );
  }

  void setAgeRange(double min, double max) {
    state = state.copyWith(minAge: min, maxAge: max);
  }

  void setPreferredFoot(String? foot) {
    state = ScoutingFilter(
      position: state.position,
      minAge: state.minAge,
      maxAge: state.maxAge,
      preferredFoot: foot,
      maxBudget: state.maxBudget,
    );
  }

  void setBudget(double budget) {
    state = state.copyWith(maxBudget: budget);
  }

  void reset() {
    state = const ScoutingFilter();
  }
}

// ── The filter actually used for the search results (updates only on "Search") ──
final activeScoutingFilterProvider =
    NotifierProvider<ActiveScoutingFilterNotifier, ScoutingFilter>(
  ActiveScoutingFilterNotifier.new,
);

class ActiveScoutingFilterNotifier extends Notifier<ScoutingFilter> {
  @override
  ScoutingFilter build() => const ScoutingFilter();

  void update(ScoutingFilter filter) {
    state = filter;
  }
}

final scoutingResultsProvider = FutureProvider<List<Player>>((ref) async {
  final repo = ref.watch(playerRepositoryProvider);
  final filter = ref.watch(activeScoutingFilterProvider);
  return repo.scoutPlayers(filter);
});

// ── Has the user triggered a scouting search? ──
final hasSearchedProvider = NotifierProvider<HasSearchedNotifier, bool>(
  HasSearchedNotifier.new,
);

class HasSearchedNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void searched() => state = true;
  void reset() => state = false;
}

// ── Bottom Navigation Index ──
final bottomNavIndexProvider = NotifierProvider<BottomNavNotifier, int>(
  BottomNavNotifier.new,
);

class BottomNavNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}
