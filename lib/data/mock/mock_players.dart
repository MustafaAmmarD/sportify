import '../models/player.dart';

final List<Map<String, dynamic>> mockPlayersJson = [
  // ── REQUIRED TOP 3 (DO NOT CHANGE) ──
  {
    'id': 'p1',
    'name': 'Ahmed Salah',
    'position': 'RW',
    'nationality': 'Egypt',
    'age': 22,
    'height': 175.0,
    'preferredFoot': 'Left',
    'availability': 'Available',
    'imageUrl': 'images/ahmed.jpg',
    'currentClub': 'Al Ahly SC',
    'marketValue': 12000000.0,
    'aiFitScore': 0.92,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.95, 'description': 'Perfect fit for your Right Winger requirements.'},
      {'category': 'Tactical Fit', 'score': 0.88, 'description': 'High pressing intensity suits your style.'},
      {'category': 'Performance', 'score': 0.94, 'description': 'Exceptional xG and chance creation in the last 6 months.'},
      {'category': 'Availability', 'score': 0.90, 'description': 'Contract expiring in 6 months; highly attainable.'},
    ],
    'biography': 'Ahmed Salah is a highly explosive winger known for his lethal cut-backs and immense pace. Emerging from the Egyptian Premier League, he has quickly become one of the most exciting young talents in African football.',
    'careerHistory': [
      {'club': 'Al Ahly SC', 'season': '2023/24', 'appearances': 34, 'goals': 14, 'assists': 8},
      {'club': 'Al Ahly SC', 'season': '2022/23', 'appearances': 22, 'goals': 5, 'assists': 4},
    ],
    'stats': {
      'totalAppearances': 56,
      'totalGoals': 19,
      'totalAssists': 12,
      'passAccuracy': 82.4,
      'yellowCards': 4,
    }
  },
  {
    'id': 'p2',
    'name': 'Karim Müller',
    'position': 'CDM',
    'nationality': 'Germany',
    'age': 25,
    'height': 188.0,
    'preferredFoot': 'Right',
    'availability': 'Scouting Only',
    'imageUrl': 'images/karim.jpg',
    'currentClub': 'VfB Stuttgart',
    'marketValue': 28500000.0,
    'aiFitScore': 0.89,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.90, 'description': 'Strong defensive midfielder profile.'},
      {'category': 'Tactical Fit', 'score': 0.92, 'description': 'Excellent ball retention and progressive passing.'},
      {'category': 'Performance', 'score': 0.89, 'description': 'Top 5% in the league for interceptions and tackles.'},
      {'category': 'Availability', 'score': 0.65, 'description': 'Recently extended contract; requires significant transfer fee.'},
    ],
    'biography': 'A towering presence in the midfield, Karim dictates the tempo of the game with his incredible vision and passing range. Often dropping between center-backs to orchestrate play, his defensive awareness is exceptional.',
    'careerHistory': [
      {'club': 'VfB Stuttgart', 'season': '2023/24', 'appearances': 30, 'goals': 2, 'assists': 5},
      {'club': 'VfB Stuttgart', 'season': '2022/23', 'appearances': 28, 'goals': 1, 'assists': 3},
    ],
    'stats': {
      'totalAppearances': 92,
      'totalGoals': 6,
      'totalAssists': 15,
      'passAccuracy': 91.2,
      'yellowCards': 18,
    }
  },
  {
    'id': 'p3',
    'name': 'Marcus Silva',
    'position': 'LB',
    'nationality': 'Brazil',
    'age': 19,
    'height': 172.0,
    'preferredFoot': 'Left',
    'availability': 'Open to Transfer',
    'imageUrl': 'images/marcus.jpg',
    'currentClub': 'Santos FC',
    'marketValue': 8000000.0,
    'aiFitScore': 0.87,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.94, 'description': 'Fits attacking full-back profile perfectly.'},
      {'category': 'Tactical Fit', 'score': 0.76, 'description': 'Needs improvement in defensive transitions.'},
      {'category': 'Performance', 'score': 0.88, 'description': 'High crossing accuracy and successful dribbles.'},
      {'category': 'Availability', 'score': 0.95, 'description': 'Club willing to negotiate; player wants Europe move.'},
    ],
    'biography': 'A dynamic and incredibly fast full-back, Marcus embodies the classic Brazilian flair. He operates almost as an auxiliary winger, constantly overlapping and delivering pinpoint crosses.',
    'careerHistory': [
      {'club': 'Santos FC', 'season': '2023', 'appearances': 24, 'goals': 1, 'assists': 7},
      {'club': 'Santos B', 'season': '2022', 'appearances': 30, 'goals': 4, 'assists': 5},
    ],
    'stats': {
      'totalAppearances': 54,
      'totalGoals': 5,
      'totalAssists': 14,
      'passAccuracy': 79.5,
      'cleanSheets': 12,
    }
  },

  // ── REAL PLAYERS ──
  {
    'id': 'p4',
    'name': 'Jude Bellingham',
    'position': 'CAM',
    'nationality': 'England',
    'age': 20,
    'height': 186.0,
    'preferredFoot': 'Right',
    'availability': 'Not Available',
    'imageUrl': 'images/jude.jpg',
    'currentClub': 'Real Madrid',
    'marketValue': 180000000.0,
    'aiFitScore': 0.86,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.98, 'description': 'Elite attacking midfielder.'},
      {'category': 'Tactical Fit', 'score': 0.95, 'description': 'Incredible box-to-box engine and finishing.'},
      {'category': 'Performance', 'score': 0.99, 'description': 'Ballon d\'Or contender performance levels.'},
      {'category': 'Availability', 'score': 0.05, 'description': 'Recently signed long-term contract at Real Madrid.'},
    ],
    'biography': 'Jude Bellingham is a generational talent. Combining physical dominance with incredible technical ability, he operates as a false 9 or advanced 10, scoring goals at an unprecedented rate for a midfielder.',
    'careerHistory': [
      {'club': 'Real Madrid', 'season': '2023/24', 'appearances': 42, 'goals': 23, 'assists': 13},
      {'club': 'Borussia Dortmund', 'season': '2022/23', 'appearances': 42, 'goals': 14, 'assists': 7},
    ],
    'stats': {
      'totalAppearances': 225,
      'totalGoals': 55,
      'totalAssists': 42,
      'passAccuracy': 88.5,
    }
  },
  {
    'id': 'p5',
    'name': 'Erling Haaland',
    'position': 'ST',
    'nationality': 'Norway',
    'age': 23,
    'height': 195.0,
    'preferredFoot': 'Left',
    'availability': 'Scouting Only',
    'imageUrl': 'images/erling.jpg',
    'currentClub': 'Manchester City',
    'marketValue': 180000000.0,
    'aiFitScore': 0.85,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.99, 'description': 'The ultimate pure number 9.'},
      {'category': 'Tactical Fit', 'score': 0.90, 'description': 'Requires service, does not drop deep often.'},
      {'category': 'Performance', 'score': 0.99, 'description': 'Breaks goalscoring records consistently.'},
      {'category': 'Availability', 'score': 0.20, 'description': 'Extremely high release clause.'},
    ],
    'biography': 'A cyborg in front of goal, Erling Haaland possesses frightening pace and power. His movement inside the box and ruthless finishing ability make him arguably the best striker of his generation.',
    'careerHistory': [
      {'club': 'Manchester City', 'season': '2023/24', 'appearances': 45, 'goals': 38, 'assists': 6},
      {'club': 'Manchester City', 'season': '2022/23', 'appearances': 53, 'goals': 52, 'assists': 9},
    ],
    'stats': {
      'totalAppearances': 275,
      'totalGoals': 230,
      'totalAssists': 48,
      'passAccuracy': 74.2,
    }
  },
  {
    'id': 'p6',
    'name': 'Kylian Mbappé',
    'position': 'LW',
    'nationality': 'France',
    'age': 25,
    'height': 178.0,
    'preferredFoot': 'Right',
    'availability': 'Not Available',
    'imageUrl': 'images/kylian.jpg',
    'currentClub': 'Real Madrid',
    'marketValue': 180000000.0,
    'aiFitScore': 0.84,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.99, 'description': 'World-class winger/striker.'},
      {'category': 'Tactical Fit', 'score': 0.95, 'description': 'Lethal in transition and counter-attacks.'},
      {'category': 'Performance', 'score': 0.98, 'description': 'Consistent 40+ goal contributions per season.'},
      {'category': 'Availability', 'score': 0.01, 'description': 'Just completed dream move to Madrid.'},
    ],
    'biography': 'Explosive pace, incredible dribbling, and a clinical finish. Kylian Mbappé is a World Cup winner and one of the most terrifying forwards for any defender to face in a 1v1 situation.',
    'careerHistory': [
      {'club': 'Paris SG', 'season': '2023/24', 'appearances': 48, 'goals': 44, 'assists': 10},
      {'club': 'Paris SG', 'season': '2022/23', 'appearances': 43, 'goals': 41, 'assists': 10},
    ],
    'stats': {
      'totalAppearances': 373,
      'totalGoals': 288,
      'totalAssists': 125,
      'passAccuracy': 84.1,
    }
  },
  {
    'id': 'p7',
    'name': 'Vinícius Júnior',
    'position': 'LW',
    'nationality': 'Brazil',
    'age': 23,
    'height': 176.0,
    'preferredFoot': 'Right',
    'availability': 'Not Available',
    'imageUrl': 'images/vinicius.jpg',
    'currentClub': 'Real Madrid',
    'marketValue': 150000000.0,
    'aiFitScore': 0.83,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.97, 'description': 'Elite inverted left winger.'},
      {'category': 'Tactical Fit', 'score': 0.94, 'description': 'Best 1v1 dribbler in world football.'},
      {'category': 'Performance', 'score': 0.95, 'description': 'Decisive in Champions League matches.'},
      {'category': 'Availability', 'score': 0.10, 'description': 'Untouchable at Real Madrid.'},
    ],
    'biography': 'Vinícius is pure samba flair mixed with killer instinct. He torments full-backs with his unpredictable dribbling and has developed into a clutch finisher on the biggest stages in European football.',
    'careerHistory': [
      {'club': 'Real Madrid', 'season': '2023/24', 'appearances': 39, 'goals': 24, 'assists': 11},
      {'club': 'Real Madrid', 'season': '2022/23', 'appearances': 55, 'goals': 23, 'assists': 21},
    ],
    'stats': {
      'totalAppearances': 264,
      'totalGoals': 83,
      'totalAssists': 75,
      'passAccuracy': 81.3,
    }
  },
  {
    'id': 'p8',
    'name': 'Lamine Yamal',
    'position': 'RW',
    'nationality': 'Spain',
    'age': 16,
    'height': 178.0,
    'preferredFoot': 'Left',
    'availability': 'Not Available',
    'imageUrl': 'images/lamine.jpg',
    'currentClub': 'FC Barcelona',
    'marketValue': 90000000.0,
    'aiFitScore': 0.82,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.95, 'description': 'Incredible young inverted winger.'},
      {'category': 'Tactical Fit', 'score': 0.90, 'description': 'Fits possession-based systems perfectly.'},
      {'category': 'Performance', 'score': 0.90, 'description': 'Breaking every youngest-player record in history.'},
      {'category': 'Availability', 'score': 0.05, 'description': 'La Masia gem, highly protected by Barcelona.'},
    ],
    'biography': 'A prodigious talent out of La Masia, Lamine Yamal possesses maturity and decision-making years beyond his age. His close control, vision, and ability to cut inside onto his left foot make him a defensive nightmare.',
    'careerHistory': [
      {'club': 'FC Barcelona', 'season': '2023/24', 'appearances': 50, 'goals': 7, 'assists': 10},
    ],
    'stats': {
      'totalAppearances': 50,
      'totalGoals': 7,
      'totalAssists': 10,
      'passAccuracy': 85.2,
    }
  },
  {
    'id': 'p9',
    'name': 'Virgil van Dijk',
    'position': 'CB',
    'nationality': 'Netherlands',
    'age': 32,
    'height': 195.0,
    'preferredFoot': 'Right',
    'availability': 'Open to Transfer',
    'imageUrl': 'images/virgil.jpg',
    'currentClub': 'Liverpool FC',
    'marketValue': 30000000.0,
    'aiFitScore': 0.81,
    'aiFitReasons': [
      {'category': 'Position Match', 'score': 0.95, 'description': 'Commanding ball-playing center-back.'},
      {'category': 'Tactical Fit', 'score': 0.92, 'description': 'Perfect for high defensive lines.'},
      {'category': 'Performance', 'score': 0.88, 'description': 'Dominant in aerial duels and 1v1s.'},
      {'category': 'Availability', 'score': 0.70, 'description': 'Entering final year of contract.'},
    ],
    'biography': 'A colossal presence at the back, Virgil van Dijk combines brute physical strength with elegant ball distribution. Known for his calmness under pressure and leadership, he is one of the best defenders of the Premier League era.',
    'careerHistory': [
      {'club': 'Liverpool FC', 'season': '2023/24', 'appearances': 48, 'goals': 4, 'assists': 2},
      {'club': 'Liverpool FC', 'season': '2022/23', 'appearances': 41, 'goals': 3, 'assists': 1},
    ],
    'stats': {
      'totalAppearances': 520,
      'totalGoals': 48,
      'totalAssists': 22,
      'passAccuracy': 90.5,
      'cleanSheets': 210,
    }
  },
];

class MockPlayers {
  static List<Player> getAllPlayers() {
    return mockPlayersJson.map((json) => Player.fromJson(json)).toList();
  }

  static List<Player> getFeaturedPlayers() {
    final players = getAllPlayers();
    return players.where((p) => p.aiFitScore >= 0.85).take(4).toList();
  }

  static Player? getPlayerById(String id) {
    try {
      return getAllPlayers().firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Player> searchPlayers(String query) {
    final players = getAllPlayers();
    final lowerQuery = query.toLowerCase();
    return players.where((p) {
      return p.name.toLowerCase().contains(lowerQuery) ||
          p.position.toLowerCase().contains(lowerQuery) ||
          p.nationality.toLowerCase().contains(lowerQuery) ||
          p.currentClub.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
