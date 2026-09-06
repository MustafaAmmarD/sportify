import '../models/player.dart';
import '../models/scouting_filter.dart';
import '../mock/mock_players.dart';

/// Abstract repository — can be swapped with a real API (e.g. Laravel backend)
abstract class PlayerRepository {
  Future<List<Player>> getAllPlayers();
  Future<List<Player>> getFeaturedPlayers();
  Future<Player?> getPlayerById(String id);
  Future<List<Player>> searchPlayers(String query);
  Future<List<Player>> scoutPlayers(ScoutingFilter filter);
}

/// Mock implementation using local data
class MockPlayerRepository implements PlayerRepository {
  @override
  Future<List<Player>> getAllPlayers() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return MockPlayers.getAllPlayers();
  }

  @override
  Future<List<Player>> getFeaturedPlayers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MockPlayers.getFeaturedPlayers();
  }

  @override
  Future<Player?> getPlayerById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MockPlayers.getPlayerById(id);
  }

  @override
  Future<List<Player>> searchPlayers(String query) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (query.trim().isEmpty) {
      return MockPlayers.getAllPlayers();
    }
    return MockPlayers.searchPlayers(query);
  }

  @override
  Future<List<Player>> scoutPlayers(ScoutingFilter filter) async {
    await Future.delayed(const Duration(milliseconds: 600));
    var players = MockPlayers.getAllPlayers();

    // Filter by position
    if (filter.position != null && filter.position!.isNotEmpty) {
      players = players.where((p) => p.position == filter.position).toList();
    }

    // Filter by age range
    players = players
        .where((p) => p.age >= filter.minAge && p.age <= filter.maxAge)
        .toList();

    // Filter by preferred foot
    if (filter.preferredFoot != null && filter.preferredFoot!.isNotEmpty) {
      players = players
          .where((p) =>
              p.preferredFoot == filter.preferredFoot ||
              p.preferredFoot == 'Both')
          .toList();
    }

    // Filter by budget (market value in millions)
    players = players
        .where((p) => p.marketValue <= filter.maxBudget * 1000000)
        .toList();

    // Sort by AI fit score (highest first)
    players.sort((a, b) => b.aiFitScore.compareTo(a.aiFitScore));

    return players;
  }
}
