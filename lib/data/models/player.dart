class CareerEntry {
  final String club;
  final String league;
  final String country;
  final String period;
  final int appearances;
  final int goals;
  final int assists;

  const CareerEntry({
    required this.club,
    required this.league,
    required this.country,
    required this.period,
    required this.appearances,
    required this.goals,
    required this.assists,
  });

  factory CareerEntry.fromJson(Map<String, dynamic> json) {
    return CareerEntry(
      club: json['club'] as String,
      league: json['league'] as String,
      country: json['country'] as String,
      period: json['period'] as String,
      appearances: json['appearances'] as int,
      goals: json['goals'] as int,
      assists: json['assists'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'club': club,
    'league': league,
    'country': country,
    'period': period,
    'appearances': appearances,
    'goals': goals,
    'assists': assists,
  };
}

class PlayerStats {
  final int totalAppearances;
  final int totalGoals;
  final int totalAssists;
  final int cleanSheets;
  final double passAccuracy;
  final double shotAccuracy;
  final int yellowCards;
  final int redCards;

  const PlayerStats({
    required this.totalAppearances,
    required this.totalGoals,
    required this.totalAssists,
    this.cleanSheets = 0,
    this.passAccuracy = 0.0,
    this.shotAccuracy = 0.0,
    this.yellowCards = 0,
    this.redCards = 0,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> json) {
    return PlayerStats(
      totalAppearances: json['totalAppearances'] as int,
      totalGoals: json['totalGoals'] as int,
      totalAssists: json['totalAssists'] as int,
      cleanSheets: json['cleanSheets'] as int? ?? 0,
      passAccuracy: (json['passAccuracy'] as num?)?.toDouble() ?? 0.0,
      shotAccuracy: (json['shotAccuracy'] as num?)?.toDouble() ?? 0.0,
      yellowCards: json['yellowCards'] as int? ?? 0,
      redCards: json['redCards'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'totalAppearances': totalAppearances,
    'totalGoals': totalGoals,
    'totalAssists': totalAssists,
    'cleanSheets': cleanSheets,
    'passAccuracy': passAccuracy,
    'shotAccuracy': shotAccuracy,
    'yellowCards': yellowCards,
    'redCards': redCards,
  };
}

class AiFitReason {
  final String category;
  final double score;
  final String description;

  const AiFitReason({
    required this.category,
    required this.score,
    required this.description,
  });

  factory AiFitReason.fromJson(Map<String, dynamic> json) {
    return AiFitReason(
      category: json['category'] as String,
      score: (json['score'] as num).toDouble(),
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'category': category,
    'score': score,
    'description': description,
  };
}

class Player {
  final String id;
  final String name;
  final String firstName;
  final String lastName;
  final String position;
  final String nationality;
  final int age;
  final double height;
  final String preferredFoot;
  final String availability;
  final String biography;
  final String imageUrl;
  final String currentClub;
  final double marketValue;
  final double aiFitScore;
  final List<AiFitReason> aiFitReasons;
  final PlayerStats stats;
  final List<CareerEntry> careerHistory;
  final String highlightVideoUrl;
  final bool isFeatured;

  const Player({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.nationality,
    required this.age,
    required this.height,
    required this.preferredFoot,
    required this.availability,
    required this.biography,
    required this.imageUrl,
    required this.currentClub,
    required this.marketValue,
    required this.aiFitScore,
    required this.aiFitReasons,
    required this.stats,
    required this.careerHistory,
    this.highlightVideoUrl = '',
    this.isFeatured = false,
  });

  String get flagEmoji {
    const flags = {
      'Egypt': '🇪🇬',
      'Germany': '🇩🇪',
      'Brazil': '🇧🇷',
      'France': '🇫🇷',
      'Nigeria': '🇳🇬',
      'Argentina': '🇦🇷',
      'Spain': '🇪🇸',
      'England': '🇬🇧',
      'Netherlands': '🇳🇱',
      'Portugal': '🇵🇹',
      'Senegal': '🇸🇳',
      'Morocco': '🇲🇦',
      'Japan': '🇯🇵',
      'South Korea': '🇰🇷',
      'Colombia': '🇨🇴',
    };
    return flags[nationality] ?? '🏳️';
  }

  String get heightFormatted => '${height.toStringAsFixed(0)} cm';
  String get marketValueFormatted {
    if (marketValue >= 1000000) {
      return '€${(marketValue / 1000000).toStringAsFixed(1)}M';
    } else if (marketValue >= 1000) {
      return '€${(marketValue / 1000).toStringAsFixed(0)}K';
    }
    return '€${marketValue.toStringAsFixed(0)}';
  }

  String get aiFitScoreFormatted => '${(aiFitScore * 100).toInt()}%';

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String,
      name: json['name'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      position: json['position'] as String,
      nationality: json['nationality'] as String,
      age: json['age'] as int,
      height: (json['height'] as num).toDouble(),
      preferredFoot: json['preferredFoot'] as String,
      availability: json['availability'] as String,
      biography: json['biography'] as String,
      imageUrl: json['imageUrl'] as String,
      currentClub: json['currentClub'] as String,
      marketValue: (json['marketValue'] as num).toDouble(),
      aiFitScore: (json['aiFitScore'] as num).toDouble(),
      aiFitReasons: (json['aiFitReasons'] as List)
          .map((e) => AiFitReason.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: PlayerStats.fromJson(json['stats'] as Map<String, dynamic>),
      careerHistory: (json['careerHistory'] as List)
          .map((e) => CareerEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      highlightVideoUrl: json['highlightVideoUrl'] as String? ?? '',
      isFeatured: json['isFeatured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'firstName': firstName,
    'lastName': lastName,
    'position': position,
    'nationality': nationality,
    'age': age,
    'height': height,
    'preferredFoot': preferredFoot,
    'availability': availability,
    'biography': biography,
    'imageUrl': imageUrl,
    'currentClub': currentClub,
    'marketValue': marketValue,
    'aiFitScore': aiFitScore,
    'aiFitReasons': aiFitReasons.map((e) => e.toJson()).toList(),
    'stats': stats.toJson(),
    'careerHistory': careerHistory.map((e) => e.toJson()).toList(),
    'highlightVideoUrl': highlightVideoUrl,
    'isFeatured': isFeatured,
  };
}
