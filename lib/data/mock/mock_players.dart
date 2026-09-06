import '../models/player.dart';

final List<Map<String, dynamic>> mockPlayersJson = [
  {
    'id': 'p1',
    'name': 'Ahmed Salah',
    'position': 'RW',
    'nationality': 'Egypt',
    'flagEmoji': '🇪🇬',
    'age': 22,
    'height': 175,
    'preferredFoot': 'Left',
    'availability': 'Available',
    'imageUrl': 'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Al Ahly SC',
    'marketValue': 12000000,
    'aiFitScore': 0.92,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Perfect fit for your Right Winger requirements.',
        'score': 0.95,
      },
      {
        'category': 'Tactical Fit',
        'description': 'High pressing intensity suits your Gegenpressing style.',
        'score': 0.88,
      },
      {
        'category': 'Performance',
        'description': 'Exceptional xG and chance creation in the last 6 months.',
        'score': 0.94,
      },
      {
        'category': 'Availability',
        'description': 'Contract expiring in 6 months; highly attainable.',
        'score': 0.90,
      }
    ],
    'biography':
        'Ahmed Salah is a highly explosive winger known for his lethal cut-backs and immense pace. Emerging from the Egyptian Premier League, he has quickly become one of the most exciting young talents in African football. His ability to isolate defenders and create shooting opportunities out of nothing makes him a constant threat.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Al Ahly SC', 'appearances': 34, 'goals': 14},
      {'season': '2022/23', 'club': 'Al Ahly SC', 'appearances': 22, 'goals': 5},
    ],
    'stats': {
      'totalAppearances': 56,
      'totalGoals': 19,
      'totalAssists': 12,
      'cleanSheets': 0,
      'yellowCards': 4,
      'redCards': 0,
      'passAccuracy': 82.4,
    }
  },
  {
    'id': 'p2',
    'name': 'Karim Müller',
    'position': 'CDM',
    'nationality': 'Germany',
    'flagEmoji': '🇩🇪',
    'age': 25,
    'height': 188,
    'preferredFoot': 'Right',
    'availability': 'Scouting Only',
    'imageUrl': 'https://images.unsplash.com/photo-1518605368461-1ee7c68cd46a?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'VfB Stuttgart',
    'marketValue': 28500000,
    'aiFitScore': 0.89,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Strong defensive midfielder profile.',
        'score': 0.90,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Excellent ball retention and progressive passing.',
        'score': 0.92,
      },
      {
        'category': 'Performance',
        'description': 'Top 5% in the league for interceptions and tackles.',
        'score': 0.89,
      },
      {
        'category': 'Availability',
        'description': 'Recently extended contract; requires significant transfer fee.',
        'score': 0.65,
      }
    ],
    'biography':
        'A towering presence in the midfield, Karim dictates the tempo of the game with his incredible vision and passing range. Often dropping between center-backs to orchestrate play, his defensive awareness is matched only by his ability to launch devastating counter-attacks with long diagonal balls.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'VfB Stuttgart', 'appearances': 30, 'goals': 2},
      {'season': '2022/23', 'club': 'VfB Stuttgart', 'appearances': 28, 'goals': 1},
      {'season': '2021/22', 'club': 'FC Köln', 'appearances': 34, 'goals': 3},
    ],
    'stats': {
      'totalAppearances': 92,
      'totalGoals': 6,
      'totalAssists': 15,
      'cleanSheets': 0,
      'yellowCards': 18,
      'redCards': 1,
      'passAccuracy': 91.2,
    }
  },
  {
    'id': 'p3',
    'name': 'Marcus Silva',
    'position': 'LB',
    'nationality': 'Brazil',
    'flagEmoji': '🇧🇷',
    'age': 19,
    'height': 172,
    'preferredFoot': 'Left',
    'availability': 'Open to Transfer',
    'imageUrl': 'https://images.unsplash.com/photo-1517466787929-bc90951d0974?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Santos FC',
    'marketValue': 8000000,
    'aiFitScore': 0.87,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Fits attacking full-back profile perfectly.',
        'score': 0.94,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Needs improvement in defensive transitions.',
        'score': 0.76,
      },
      {
        'category': 'Performance',
        'description': 'High crossing accuracy and successful dribbles.',
        'score': 0.88,
      },
      {
        'category': 'Availability',
        'description': 'Club willing to negotiate; player wants Europe move.',
        'score': 0.95,
      }
    ],
    'biography':
        'A dynamic and incredibly fast full-back, Marcus embodies the classic Brazilian flair. He operates almost as an auxiliary winger, constantly overlapping and delivering pinpoint crosses. While his defensive positioning is still maturing, his offensive output makes him a highly sought-after prospect.',
    'careerHistory': [
      {'season': '2023', 'club': 'Santos FC', 'appearances': 24, 'goals': 1},
      {'season': '2022', 'club': 'Santos B', 'appearances': 30, 'goals': 4},
    ],
    'stats': {
      'totalAppearances': 54,
      'totalGoals': 5,
      'totalAssists': 14,
      'cleanSheets': 12,
      'yellowCards': 8,
      'redCards': 0,
      'passAccuracy': 79.5,
    }
  },
  {
    'id': 'p4',
    'name': 'Thiago Rossi',
    'position': 'CB',
    'nationality': 'Italy',
    'flagEmoji': '🇮🇹',
    'age': 28,
    'height': 191,
    'preferredFoot': 'Right',
    'availability': 'Not Available',
    'imageUrl': 'https://images.unsplash.com/photo-1551280628-868d4a4d6232?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Juventus',
    'marketValue': 45000000,
    'aiFitScore': 0.82,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'World-class ball-playing defender.',
        'score': 0.98,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Suits possession-based systems perfectly.',
        'score': 0.95,
      },
      {
        'category': 'Performance',
        'description': 'Exceptional aerial duel win rate (78%).',
        'score': 0.95,
      },
      {
        'category': 'Availability',
        'description': 'Crucial player for current club; not for sale.',
        'score': 0.20,
      }
    ],
    'biography':
        'Thiago is a modern gladiator. A center-back who reads the game like a veteran, he rarely needs to make sliding tackles because his positioning is flawless. Renowned for his leadership and ability to play line-breaking passes out from the back, he is the anchor of his team.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Juventus', 'appearances': 35, 'goals': 4},
      {'season': '2022/23', 'club': 'Juventus', 'appearances': 38, 'goals': 2},
      {'season': '2021/22', 'club': 'Torino', 'appearances': 36, 'goals': 3},
    ],
    'stats': {
      'totalAppearances': 210,
      'totalGoals': 14,
      'totalAssists': 5,
      'cleanSheets': 85,
      'yellowCards': 42,
      'redCards': 3,
      'passAccuracy': 93.1,
    }
  },
  {
    'id': 'p5',
    'name': 'Ethan Brooks',
    'position': 'ST',
    'nationality': 'England',
    'flagEmoji': '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
    'age': 21,
    'height': 185,
    'preferredFoot': 'Right',
    'availability': 'Available',
    'imageUrl': 'https://images.unsplash.com/photo-1508344928928-7165b67de128?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Aston Villa',
    'marketValue': 22000000,
    'aiFitScore': 0.85,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Fits target man and poacher roles.',
        'score': 0.88,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Excellent hold-up play; average pressing.',
        'score': 0.80,
      },
      {
        'category': 'Performance',
        'description': 'Consistently outperforms xG.',
        'score': 0.89,
      },
      {
        'category': 'Availability',
        'description': 'Looking for more starting minutes.',
        'score': 0.85,
      }
    ],
    'biography':
        'A clinical finisher inside the box, Ethan has a natural instinct for being in the right place at the right time. While not the fastest striker, his strength and intelligent movement make him a nightmare for center-backs. He is currently looking for a club where he can be the main attacking focal point.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Aston Villa', 'appearances': 22, 'goals': 8},
      {'season': '2022/23', 'club': 'Championship Loan', 'appearances': 38, 'goals': 19},
    ],
    'stats': {
      'totalAppearances': 60,
      'totalGoals': 27,
      'totalAssists': 4,
      'cleanSheets': 0,
      'yellowCards': 2,
      'redCards': 0,
      'passAccuracy': 74.2,
    }
  },
  {
    'id': 'p6',
    'name': 'Lucas Fernandes',
    'position': 'CAM',
    'nationality': 'Portugal',
    'flagEmoji': '🇵🇹',
    'age': 24,
    'height': 176,
    'preferredFoot': 'Right',
    'availability': 'Open to Transfer',
    'imageUrl': 'https://images.unsplash.com/photo-1605328229868-d052d9a695a1?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Sporting CP',
    'marketValue': 35000000,
    'aiFitScore': 0.86,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Creative playmaker with high shot volume.',
        'score': 0.90,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Thrives in a free role behind the striker.',
        'score': 0.88,
      },
      {
        'category': 'Performance',
        'description': 'Leads league in key passes.',
        'score': 0.92,
      },
      {
        'category': 'Availability',
        'description': 'Release clause active this summer.',
        'score': 0.75,
      }
    ],
    'biography':
        'A classic number 10 with a modern work ethic. Lucas dictates play in the final third, finding pockets of space between the opposition\'s midfield and defense. His trademark is a lethal long-range shot and the ability to thread impossible through balls.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Sporting CP', 'appearances': 32, 'goals': 12},
      {'season': '2022/23', 'club': 'Sporting CP', 'appearances': 28, 'goals': 7},
    ],
    'stats': {
      'totalAppearances': 110,
      'totalGoals': 31,
      'totalAssists': 42,
      'cleanSheets': 0,
      'yellowCards': 12,
      'redCards': 0,
      'passAccuracy': 86.8,
    }
  },
  {
    'id': 'p7',
    'name': 'Jean-Luc Dubois',
    'position': 'GK',
    'nationality': 'France',
    'flagEmoji': '🇫🇷',
    'age': 20,
    'height': 195,
    'preferredFoot': 'Right',
    'availability': 'Scouting Only',
    'imageUrl': 'https://images.unsplash.com/photo-1431324155629-1a6d0a11f581?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Lille OSC',
    'marketValue': 15000000,
    'aiFitScore': 0.81,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Sweeper keeper profile.',
        'score': 0.85,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Good distribution; prone to occasional errors.',
        'score': 0.72,
      },
      {
        'category': 'Performance',
        'description': 'High save percentage on shots inside the box.',
        'score': 0.88,
      },
      {
        'category': 'Availability',
        'description': 'Recently broke into first team.',
        'score': 0.80,
      }
    ],
    'biography':
        'An incredibly athletic young goalkeeper, Jean-Luc is known for his spectacular reflex saves and brave sweeping. While he still needs to refine his decision-making when claiming crosses, his raw shot-stopping ability marks him as a future national team prospect.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Lille OSC', 'appearances': 18, 'goals': 0},
      {'season': '2022/23', 'club': 'Lille B', 'appearances': 25, 'goals': 0},
    ],
    'stats': {
      'totalAppearances': 43,
      'totalGoals': 0,
      'totalAssists': 1,
      'cleanSheets': 14,
      'yellowCards': 1,
      'redCards': 0,
      'passAccuracy': 71.0,
    }
  },
  {
    'id': 'p8',
    'name': 'Mateo Garcia',
    'position': 'CM',
    'nationality': 'Spain',
    'flagEmoji': '🇪🇸',
    'age': 26,
    'height': 180,
    'preferredFoot': 'Right',
    'availability': 'Open to Transfer',
    'imageUrl': 'https://images.unsplash.com/photo-1624523946059-86641ab3f271?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Real Betis',
    'marketValue': 24000000,
    'aiFitScore': 0.84,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Versatile box-to-box midfielder.',
        'score': 0.86,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Incredible stamina; fits high-tempo systems.',
        'score': 0.92,
      },
      {
        'category': 'Performance',
        'description': 'High volume of progressive carries.',
        'score': 0.85,
      },
      {
        'category': 'Availability',
        'description': 'Looking for Champions League football.',
        'score': 0.75,
      }
    ],
    'biography':
        'Mateo is the engine room of his team. A tireless box-to-box midfielder who covers every blade of grass, he connects the defense to the attack seamlessly. His work rate is unmatched, and he frequently arrives late in the box to score crucial goals.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Real Betis', 'appearances': 36, 'goals': 5},
      {'season': '2022/23', 'club': 'Real Betis', 'appearances': 34, 'goals': 4},
    ],
    'stats': {
      'totalAppearances': 150,
      'totalGoals': 18,
      'totalAssists': 22,
      'cleanSheets': 0,
      'yellowCards': 28,
      'redCards': 1,
      'passAccuracy': 88.5,
    }
  },
  {
    'id': 'p9',
    'name': 'Yuto Tanaka',
    'position': 'RB',
    'nationality': 'Japan',
    'flagEmoji': '🇯🇵',
    'age': 23,
    'height': 174,
    'preferredFoot': 'Right',
    'availability': 'Available',
    'imageUrl': 'https://images.unsplash.com/photo-1522778119026-d647f0596c20?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Celtic FC',
    'marketValue': 9500000,
    'aiFitScore': 0.83,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Inverted full-back specialist.',
        'score': 0.88,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Tucks into midfield perfectly in possession.',
        'score': 0.94,
      },
      {
        'category': 'Performance',
        'description': 'High passing accuracy under pressure.',
        'score': 0.80,
      },
      {
        'category': 'Availability',
        'description': 'Reasonable release clause.',
        'score': 0.72,
      }
    ],
    'biography':
        'A modern inverted full-back, Yuto is just as comfortable drifting into central midfield to dictate play as he is overlapping on the flank. His technical security and tactical intelligence make him vital for teams that dominate possession.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Celtic FC', 'appearances': 28, 'goals': 2},
      {'season': '2022/23', 'club': 'J-League', 'appearances': 34, 'goals': 3},
    ],
    'stats': {
      'totalAppearances': 85,
      'totalGoals': 6,
      'totalAssists': 16,
      'cleanSheets': 28,
      'yellowCards': 10,
      'redCards': 0,
      'passAccuracy': 89.9,
    }
  },
  {
    'id': 'p10',
    'name': 'Viktor Ivanov',
    'position': 'CB',
    'nationality': 'Serbia',
    'flagEmoji': '🇷🇸',
    'age': 27,
    'height': 193,
    'preferredFoot': 'Right',
    'availability': 'Open to Transfer',
    'imageUrl': 'https://images.unsplash.com/photo-1553147775-f725ea6ce288?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Fiorentina',
    'marketValue': 18000000,
    'aiFitScore': 0.79,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Aggressive, no-nonsense defender.',
        'score': 0.82,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Struggles in high lines due to lack of pace.',
        'score': 0.65,
      },
      {
        'category': 'Performance',
        'description': 'Dominant in the air; threat on set-pieces.',
        'score': 0.85,
      },
      {
        'category': 'Availability',
        'description': 'In final year of contract.',
        'score': 0.88,
      }
    ],
    'biography':
        'A towering and aggressive center-half, Viktor is a traditional, no-nonsense defender. He dominates aerial duels and loves a hard tackle. While he lacks the explosive pace for a high defensive line, in a deep block, he is virtually impassable.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'Fiorentina', 'appearances': 32, 'goals': 4},
      {'season': '2022/23', 'club': 'Fiorentina', 'appearances': 29, 'goals': 2},
    ],
    'stats': {
      'totalAppearances': 178,
      'totalGoals': 15,
      'totalAssists': 2,
      'cleanSheets': 54,
      'yellowCards': 38,
      'redCards': 4,
      'passAccuracy': 78.4,
    }
  },
  {
    'id': 'p11',
    'name': 'Samuel Osei',
    'position': 'LW',
    'nationality': 'Ghana',
    'flagEmoji': '🇬🇭',
    'age': 18,
    'height': 178,
    'preferredFoot': 'Right',
    'availability': 'Scouting Only',
    'imageUrl': 'https://images.unsplash.com/photo-1550091480-1a7f0506eb36?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'FC Nordsjælland',
    'marketValue': 6500000,
    'aiFitScore': 0.85,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Inverted winger profile.',
        'score': 0.88,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Requires tactical discipline training.',
        'score': 0.70,
      },
      {
        'category': 'Performance',
        'description': 'Incredible dribbling success rate (68%).',
        'score': 0.92,
      },
      {
        'category': 'Availability',
        'description': 'High potential; requires high investment.',
        'score': 0.88,
      }
    ],
    'biography':
        'Samuel is one of the most exciting teenagers in European football right now. Blessed with raw pace and mesmerising dribbling skills, he plays with a street-football flair that gets fans off their seats. His decision-making is still developing, but his ceiling is immense.',
    'careerHistory': [
      {'season': '2023/24', 'club': 'FC Nordsjælland', 'appearances': 15, 'goals': 4},
    ],
    'stats': {
      'totalAppearances': 15,
      'totalGoals': 4,
      'totalAssists': 3,
      'cleanSheets': 0,
      'yellowCards': 2,
      'redCards': 0,
      'passAccuracy': 76.5,
    }
  },
  {
    'id': 'p12',
    'name': 'Santiago Reyes',
    'position': 'CDM',
    'nationality': 'Colombia',
    'flagEmoji': '🇨🇴',
    'age': 22,
    'height': 182,
    'preferredFoot': 'Right',
    'availability': 'Available',
    'imageUrl': 'https://images.unsplash.com/photo-1628891435222-065922097723?q=80&w=400&auto=format&fit=crop',
    'currentClub': 'Atlético Nacional',
    'marketValue': 4500000,
    'aiFitScore': 0.78,
    'aiFitReasons': [
      {
        'category': 'Position Match',
        'description': 'Classic ball-winning midfielder.',
        'score': 0.82,
      },
      {
        'category': 'Tactical Fit',
        'description': 'Aggressive pressing but poor passing range.',
        'score': 0.65,
      },
      {
        'category': 'Performance',
        'description': 'Leads league in tackles won.',
        'score': 0.85,
      },
      {
        'category': 'Availability',
        'description': 'Cheap release clause; ready for Europe.',
        'score': 0.80,
      }
    ],
    'biography':
        'A fierce and combative defensive midfielder, Santiago thrives in breaking up opposition play. He is known as "El Muro" (The Wall) in Colombia due to his aggressive tackling. While his distribution is limited, his defensive output provides incredible stability.',
    'careerHistory': [
      {'season': '2023', 'club': 'Atlético Nacional', 'appearances': 38, 'goals': 1},
      {'season': '2022', 'club': 'Atlético Nacional', 'appearances': 22, 'goals': 0},
    ],
    'stats': {
      'totalAppearances': 60,
      'totalGoals': 1,
      'totalAssists': 4,
      'cleanSheets': 0,
      'yellowCards': 21,
      'redCards': 2,
      'passAccuracy': 75.3,
    }
  },
];
