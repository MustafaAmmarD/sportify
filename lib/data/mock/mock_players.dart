import '../models/player.dart';

class MockPlayers {
  MockPlayers._();

  static const List<Map<String, dynamic>> _playersJson = [
    {
      'id': 'p1',
      'name': 'Ahmed Salah',
      'firstName': 'Ahmed',
      'lastName': 'Salah',
      'position': 'RW',
      'nationality': 'Egypt',
      'age': 24,
      'height': 181,
      'preferredFoot': 'Left',
      'availability': 'Available Now',
      'biography':
          'Ahmed Salah is a dynamic right winger known for his blistering pace and clinical finishing. Born in Cairo, he developed his skills in the Egyptian youth academies before earning a move to Europe. His ability to cut inside from the right flank on his favoured left foot makes him a constant goal threat. Ahmed combines technical flair with tactical intelligence, making him one of the most sought-after young talents in African football.',
      'imageUrl': 'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?w=400&fit=crop',
      'currentClub': 'FC Dynamo',
      'marketValue': 8500000,
      'aiFitScore': 0.92,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.95,
          'description':
              'Perfect fit for the right wing role with cutting inside ability'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.90,
          'description':
              'Suits high-pressing systems with quick counter-attacking transitions'
        },
        {
          'category': 'Performance',
          'score': 0.93,
          'description':
              'Consistent goal contributions with 15+ goals and 10+ assists per season'
        },
        {
          'category': 'Availability',
          'score': 0.88,
          'description': 'Contract expiring soon, open to new opportunities'
        }
      ],
      'stats': {
        'totalAppearances': 187,
        'totalGoals': 64,
        'totalAssists': 42,
        'cleanSheets': 0,
        'passAccuracy': 82.5,
        'shotAccuracy': 68.3,
        'yellowCards': 12,
        'redCards': 1
      },
      'careerHistory': [
        {
          'club': 'FC Dynamo',
          'league': 'Bundesliga',
          'country': 'Germany',
          'period': '2023 - Present',
          'appearances': 67,
          'goals': 28,
          'assists': 18
        },
        {
          'club': 'AS Sporting',
          'league': 'Ligue 1',
          'country': 'France',
          'period': '2021 - 2023',
          'appearances': 74,
          'goals': 22,
          'assists': 15
        },
        {
          'club': 'Al-Ahly SC',
          'league': 'Egyptian Premier',
          'country': 'Egypt',
          'period': '2019 - 2021',
          'appearances': 46,
          'goals': 14,
          'assists': 9
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/ahmed-salah',
      'isFeatured': true
    },
    {
      'id': 'p2',
      'name': 'Karim Müller',
      'firstName': 'Karim',
      'lastName': 'Müller',
      'position': 'CAM',
      'nationality': 'Germany',
      'age': 26,
      'height': 178,
      'preferredFoot': 'Right',
      'availability': 'In Negotiation',
      'biography':
          'Karim Müller is a creative attacking midfielder with exceptional vision and passing range. Born in Munich to a German-Moroccan family, he possesses a rare combination of technical brilliance and work ethic. Known as "The Architect" for his ability to orchestrate attacks, Karim has been instrumental in his teams\' offensive output. His set-piece delivery and ability to score from distance make him a complete number 10.',
      'imageUrl': 'https://images.unsplash.com/photo-1517466787929-bc90951d0974?w=400&fit=crop',
      'currentClub': 'Rot-Weiß Berlin',
      'marketValue': 12000000,
      'aiFitScore': 0.89,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.92,
          'description': 'Elite playmaker suited for the No.10 role'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.88,
          'description':
              'Thrives in possession-based systems with quick combinations'
        },
        {
          'category': 'Performance',
          'score': 0.90,
          'description':
              'Consistently delivers 10+ assists and 8+ goals per season'
        },
        {
          'category': 'Availability',
          'score': 0.85,
          'description': 'Currently in contract negotiations, potential move likely'
        }
      ],
      'stats': {
        'totalAppearances': 214,
        'totalGoals': 47,
        'totalAssists': 78,
        'cleanSheets': 0,
        'passAccuracy': 88.7,
        'shotAccuracy': 55.2,
        'yellowCards': 18,
        'redCards': 0
      },
      'careerHistory': [
        {
          'club': 'Rot-Weiß Berlin',
          'league': 'Bundesliga',
          'country': 'Germany',
          'period': '2022 - Present',
          'appearances': 89,
          'goals': 22,
          'assists': 38
        },
        {
          'club': 'VfB Stuttgart',
          'league': 'Bundesliga',
          'country': 'Germany',
          'period': '2019 - 2022',
          'appearances': 96,
          'goals': 18,
          'assists': 31
        },
        {
          'club': 'Bayern Munich II',
          'league': '3. Liga',
          'country': 'Germany',
          'period': '2017 - 2019',
          'appearances': 29,
          'goals': 7,
          'assists': 9
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/karim-muller',
      'isFeatured': true
    },
    {
      'id': 'p3',
      'name': 'Marcus Silva',
      'firstName': 'Marcus',
      'lastName': 'Silva',
      'position': 'ST',
      'nationality': 'Brazil',
      'age': 22,
      'height': 185,
      'preferredFoot': 'Right',
      'availability': 'Available Now',
      'biography':
          'Marcus Silva is a powerful young striker from São Paulo known for his aerial dominance and predatory instincts in the box. Despite his youth, Marcus has already made waves in South American football with his remarkable goal-scoring record. His physicality combined with surprising technical finesse makes him a nightmare for defenders. Marcus is seen as one of Brazil\'s most promising future stars.',
      'imageUrl': 'https://images.unsplash.com/photo-1543326727-cf6c39e8f84c?w=400&fit=crop',
      'currentClub': 'SC Internacional',
      'marketValue': 6000000,
      'aiFitScore': 0.87,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.90,
          'description': 'Classic No.9 with strong hold-up play and finishing'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.85,
          'description': 'Ideal target man for direct attacking systems'
        },
        {
          'category': 'Performance',
          'score': 0.88,
          'description': 'Outstanding goals-per-game ratio of 0.52 in last season'
        },
        {
          'category': 'Availability',
          'score': 0.84,
          'description': 'Club willing to negotiate, affordable transfer fee'
        }
      ],
      'stats': {
        'totalAppearances': 112,
        'totalGoals': 48,
        'totalAssists': 15,
        'cleanSheets': 0,
        'passAccuracy': 72.1,
        'shotAccuracy': 71.8,
        'yellowCards': 22,
        'redCards': 2
      },
      'careerHistory': [
        {
          'club': 'SC Internacional',
          'league': 'Brasileirão',
          'country': 'Brazil',
          'period': '2022 - Present',
          'appearances': 78,
          'goals': 36,
          'assists': 11
        },
        {
          'club': 'São Paulo FC',
          'league': 'Brasileirão',
          'country': 'Brazil',
          'period': '2020 - 2022',
          'appearances': 34,
          'goals': 12,
          'assists': 4
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/marcus-silva',
      'isFeatured': true
    },
    {
      'id': 'p4',
      'name': 'Ousmane Diallo',
      'firstName': 'Ousmane',
      'lastName': 'Diallo',
      'position': 'CB',
      'nationality': 'Senegal',
      'age': 27,
      'height': 192,
      'preferredFoot': 'Right',
      'availability': 'Free Agent',
      'biography':
          'Ousmane Diallo is a commanding centre-back whose physical presence and reading of the game have earned him comparisons with the great defensive leaders. Standing at 192cm, he dominates aerial duels and brings composure on the ball from the back. His leadership qualities and experience in European leagues make him a reliable option for any team seeking defensive stability.',
      'imageUrl': 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400&fit=crop',
      'currentClub': 'Free Agent',
      'marketValue': 5500000,
      'aiFitScore': 0.84,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.92,
          'description': 'Dominant ball-playing centre-back'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.82,
          'description': 'Excellent in high-line defensive systems'
        },
        {
          'category': 'Performance',
          'score': 0.80,
          'description': '78% aerial duel win rate, 89% pass accuracy'
        },
        {
          'category': 'Availability',
          'score': 0.95,
          'description': 'Free agent — immediately available with no transfer fee'
        }
      ],
      'stats': {
        'totalAppearances': 198,
        'totalGoals': 12,
        'totalAssists': 5,
        'cleanSheets': 72,
        'passAccuracy': 89.2,
        'shotAccuracy': 45.0,
        'yellowCards': 34,
        'redCards': 3
      },
      'careerHistory': [
        {
          'club': 'RC Strasbourg',
          'league': 'Ligue 1',
          'country': 'France',
          'period': '2021 - 2025',
          'appearances': 112,
          'goals': 8,
          'assists': 3
        },
        {
          'club': 'Dakar SC',
          'league': 'Senegal Premier',
          'country': 'Senegal',
          'period': '2018 - 2021',
          'appearances': 86,
          'goals': 4,
          'assists': 2
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/ousmane-diallo',
      'isFeatured': false
    },
    {
      'id': 'p5',
      'name': 'Takeshi Nakamura',
      'firstName': 'Takeshi',
      'lastName': 'Nakamura',
      'position': 'CM',
      'nationality': 'Japan',
      'age': 25,
      'height': 174,
      'preferredFoot': 'Both',
      'availability': 'On Contract',
      'biography':
          'Takeshi Nakamura is a tireless central midfielder renowned for his engine and technical precision. A product of the J-League academy system, he combines Japanese football\'s emphasis on technical development with European intensity. His box-to-box capabilities allow him to contribute both defensively and offensively, making him the heartbeat of any midfield.',
      'imageUrl': 'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=400&fit=crop',
      'currentClub': 'PSV Eindhoven',
      'marketValue': 15000000,
      'aiFitScore': 0.86,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.88,
          'description': 'Versatile midfielder who can play CM and CDM'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.90,
          'description': 'Elite ball retention and pressing intensity'
        },
        {
          'category': 'Performance',
          'score': 0.85,
          'description': '91% pass accuracy with 3.2 interceptions per game'
        },
        {
          'category': 'Availability',
          'score': 0.78,
          'description': 'Under contract but club open to offers above €15M'
        }
      ],
      'stats': {
        'totalAppearances': 167,
        'totalGoals': 18,
        'totalAssists': 34,
        'cleanSheets': 0,
        'passAccuracy': 91.3,
        'shotAccuracy': 48.5,
        'yellowCards': 28,
        'redCards': 1
      },
      'careerHistory': [
        {
          'club': 'PSV Eindhoven',
          'league': 'Eredivisie',
          'country': 'Netherlands',
          'period': '2022 - Present',
          'appearances': 95,
          'goals': 12,
          'assists': 22
        },
        {
          'club': 'Kawasaki Frontale',
          'league': 'J1 League',
          'country': 'Japan',
          'period': '2019 - 2022',
          'appearances': 72,
          'goals': 6,
          'assists': 12
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/takeshi-nakamura',
      'isFeatured': false
    },
    {
      'id': 'p6',
      'name': 'Lucas Moreau',
      'firstName': 'Lucas',
      'lastName': 'Moreau',
      'position': 'LB',
      'nationality': 'France',
      'age': 23,
      'height': 179,
      'preferredFoot': 'Left',
      'availability': 'Available Now',
      'biography':
          'Lucas Moreau is an attacking left-back with exceptional crossing ability and pace. Raised in the Parisian suburbs, he developed through the renowned French youth system. His overlapping runs and delivery from wide areas create constant threats, while his defensive awareness has improved significantly. Lucas represents the modern full-back — equally dangerous in attack and solid in defence.',
      'imageUrl': 'https://images.unsplash.com/photo-1551958219-acbc608c6377?w=400&fit=crop',
      'currentClub': 'OGC Nice',
      'marketValue': 7000000,
      'aiFitScore': 0.83,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.90,
          'description': 'Natural left-back with wing-back versatility'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.82,
          'description': 'Ideal for systems requiring overlapping full-backs'
        },
        {
          'category': 'Performance',
          'score': 0.80,
          'description': '6.8 crosses per game with 32% accuracy, 2.1 tackles'
        },
        {
          'category': 'Availability',
          'score': 0.85,
          'description': 'Release clause of €7M, actively seeking new challenge'
        }
      ],
      'stats': {
        'totalAppearances': 134,
        'totalGoals': 6,
        'totalAssists': 28,
        'cleanSheets': 38,
        'passAccuracy': 84.6,
        'shotAccuracy': 40.0,
        'yellowCards': 15,
        'redCards': 0
      },
      'careerHistory': [
        {
          'club': 'OGC Nice',
          'league': 'Ligue 1',
          'country': 'France',
          'period': '2022 - Present',
          'appearances': 82,
          'goals': 4,
          'assists': 20
        },
        {
          'club': 'FC Nantes',
          'league': 'Ligue 1',
          'country': 'France',
          'period': '2020 - 2022',
          'appearances': 52,
          'goals': 2,
          'assists': 8
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/lucas-moreau',
      'isFeatured': false
    },
    {
      'id': 'p7',
      'name': 'Emeka Obi',
      'firstName': 'Emeka',
      'lastName': 'Obi',
      'position': 'CDM',
      'nationality': 'Nigeria',
      'age': 28,
      'height': 186,
      'preferredFoot': 'Right',
      'availability': 'Available Now',
      'biography':
          'Emeka Obi is a dominant defensive midfielder whose physicality and tactical intelligence make him a shield for any defence. Born in Lagos, he rose through Nigerian football before establishing himself in Portuguese and Spanish leagues. Known for his interceptions, powerful tackling, and ability to break up play, Emeka is the type of player every top team needs — the unsung hero who makes everyone around him better.',
      'imageUrl': 'https://images.unsplash.com/photo-1560272564-c83b66b1ad12?w=400&fit=crop',
      'currentClub': 'Real Betis',
      'marketValue': 11000000,
      'aiFitScore': 0.81,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.88,
          'description': 'Classic defensive midfielder — breaks up play effectively'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.82,
          'description': 'Anchors the midfield in 4-3-3 and 4-2-3-1 formations'
        },
        {
          'category': 'Performance',
          'score': 0.78,
          'description': '4.1 tackles per game, 2.8 interceptions, 87% pass accuracy'
        },
        {
          'category': 'Availability',
          'score': 0.80,
          'description': 'Available for transfer, club seeking €11M'
        }
      ],
      'stats': {
        'totalAppearances': 232,
        'totalGoals': 8,
        'totalAssists': 19,
        'cleanSheets': 0,
        'passAccuracy': 87.4,
        'shotAccuracy': 38.5,
        'yellowCards': 52,
        'redCards': 4
      },
      'careerHistory': [
        {
          'club': 'Real Betis',
          'league': 'La Liga',
          'country': 'Spain',
          'period': '2023 - Present',
          'appearances': 56,
          'goals': 2,
          'assists': 6
        },
        {
          'club': 'SC Braga',
          'league': 'Primeira Liga',
          'country': 'Portugal',
          'period': '2020 - 2023',
          'appearances': 98,
          'goals': 4,
          'assists': 9
        },
        {
          'club': 'Enyimba FC',
          'league': 'NPFL',
          'country': 'Nigeria',
          'period': '2017 - 2020',
          'appearances': 78,
          'goals': 2,
          'assists': 4
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/emeka-obi',
      'isFeatured': false
    },
    {
      'id': 'p8',
      'name': 'Diego Fernández',
      'firstName': 'Diego',
      'lastName': 'Fernández',
      'position': 'LW',
      'nationality': 'Argentina',
      'age': 21,
      'height': 172,
      'preferredFoot': 'Right',
      'availability': 'On Loan',
      'biography':
          'Diego Fernández is an electrifying young left winger whose dribbling and close control have drawn comparisons to Argentine greats. At just 21, his ability to beat defenders one-on-one is remarkable. Quick feet, low centre of gravity, and an eye for the spectacular make him a fan favourite wherever he plays. Diego is on loan to gain experience but is expected to become a key player for years to come.',
      'imageUrl': 'https://images.unsplash.com/photo-1553778263-73a83bab9b0c?w=400&fit=crop',
      'currentClub': 'Fiorentina (on loan from River Plate)',
      'marketValue': 9500000,
      'aiFitScore': 0.85,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.90,
          'description': 'Natural left winger with inverted cutting ability'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.86,
          'description': 'Excels in creative, fluid attacking systems'
        },
        {
          'category': 'Performance',
          'score': 0.85,
          'description': '4.2 dribbles per game, 78% success rate'
        },
        {
          'category': 'Availability',
          'score': 0.75,
          'description': 'Currently on loan, permanent deal possible for €10M+'
        }
      ],
      'stats': {
        'totalAppearances': 89,
        'totalGoals': 19,
        'totalAssists': 24,
        'cleanSheets': 0,
        'passAccuracy': 79.8,
        'shotAccuracy': 52.0,
        'yellowCards': 8,
        'redCards': 0
      },
      'careerHistory': [
        {
          'club': 'Fiorentina (Loan)',
          'league': 'Serie A',
          'country': 'Italy',
          'period': '2025 - Present',
          'appearances': 18,
          'goals': 5,
          'assists': 7
        },
        {
          'club': 'River Plate',
          'league': 'Liga Profesional',
          'country': 'Argentina',
          'period': '2022 - Present',
          'appearances': 71,
          'goals': 14,
          'assists': 17
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/diego-fernandez',
      'isFeatured': true
    },
    {
      'id': 'p9',
      'name': 'Youssef El-Amrani',
      'firstName': 'Youssef',
      'lastName': 'El-Amrani',
      'position': 'GK',
      'nationality': 'Morocco',
      'age': 29,
      'height': 194,
      'preferredFoot': 'Right',
      'availability': 'Available Now',
      'biography':
          'Youssef El-Amrani is a commanding goalkeeper whose shot-stopping ability and distribution have made him one of the most reliable keepers in European football. His reflexes are exceptional, and his ability to play out from the back makes him invaluable in modern possession-based systems. A AFCON veteran, Youssef brings big-game experience and leadership to any squad.',
      'imageUrl': 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400&fit=crop',
      'currentClub': 'Sevilla FC',
      'marketValue': 8000000,
      'aiFitScore': 0.79,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.92,
          'description': 'Modern sweeper-keeper with excellent distribution'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.78,
          'description': 'Perfect for high-line systems requiring a proactive keeper'
        },
        {
          'category': 'Performance',
          'score': 0.76,
          'description': '74% save rate, 12 clean sheets last season'
        },
        {
          'category': 'Availability',
          'score': 0.82,
          'description': 'Club open to offers above €8M'
        }
      ],
      'stats': {
        'totalAppearances': 245,
        'totalGoals': 0,
        'totalAssists': 2,
        'cleanSheets': 84,
        'passAccuracy': 82.0,
        'shotAccuracy': 0,
        'yellowCards': 8,
        'redCards': 1
      },
      'careerHistory': [
        {
          'club': 'Sevilla FC',
          'league': 'La Liga',
          'country': 'Spain',
          'period': '2021 - Present',
          'appearances': 128,
          'goals': 0,
          'assists': 2
        },
        {
          'club': 'Wydad Casablanca',
          'league': 'Botola Pro',
          'country': 'Morocco',
          'period': '2017 - 2021',
          'appearances': 117,
          'goals': 0,
          'assists': 0
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/youssef-amrani',
      'isFeatured': false
    },
    {
      'id': 'p10',
      'name': 'Santiago Reyes',
      'firstName': 'Santiago',
      'lastName': 'Reyes',
      'position': 'CF',
      'nationality': 'Colombia',
      'age': 20,
      'height': 180,
      'preferredFoot': 'Left',
      'availability': 'Available Now',
      'biography':
          'Santiago Reyes is an exciting young forward who can play as a centre-forward or second striker. At just 20 years old, he has already shown remarkable maturity in front of goal. His intelligent movement, clinical finishing, and ability to link play make him a versatile threat. Santiago is widely regarded as Colombia\'s next big export and has been scouted by multiple European clubs.',
      'imageUrl': 'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=400&fit=crop',
      'currentClub': 'Atlético Nacional',
      'marketValue': 4500000,
      'aiFitScore': 0.78,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.85,
          'description': 'Versatile forward — can play CF or as a second striker'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.88,
          'description':
              'Exceptional movement and link-up play suit fluid attacking systems'
        },
        {
          'category': 'Performance',
          'score': 0.90,
          'description':
              'Outstanding 0.61 goals-per-game at just 20 years old'
        },
        {
          'category': 'Availability',
          'score': 0.92,
          'description': 'Affordable release clause of €5M, eager for European move'
        }
      ],
      'stats': {
        'totalAppearances': 68,
        'totalGoals': 32,
        'totalAssists': 11,
        'cleanSheets': 0,
        'passAccuracy': 76.5,
        'shotAccuracy': 65.2,
        'yellowCards': 6,
        'redCards': 0
      },
      'careerHistory': [
        {
          'club': 'Atlético Nacional',
          'league': 'Categoría Primera A',
          'country': 'Colombia',
          'period': '2023 - Present',
          'appearances': 52,
          'goals': 28,
          'assists': 9
        },
        {
          'club': 'Atlético Nacional (Youth)',
          'league': 'Youth League',
          'country': 'Colombia',
          'period': '2021 - 2023',
          'appearances': 16,
          'goals': 4,
          'assists': 2
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/santiago-reyes',
      'isFeatured': true
    },
    {
      'id': 'p11',
      'name': 'Rui Henriques',
      'firstName': 'Rui',
      'lastName': 'Henriques',
      'position': 'RB',
      'nationality': 'Portugal',
      'age': 24,
      'height': 177,
      'preferredFoot': 'Right',
      'availability': 'On Contract',
      'biography':
          'Rui Henriques is a technically gifted right-back from Porto whose attacking instincts and defensive discipline have caught the attention of top European scouts. His ability to provide width, deliver precise crosses, and track back tirelessly makes him a complete modern full-back. Rui combines Portuguese flair with tactical discipline, making him equally effective in attack and defence.',
      'imageUrl': 'https://images.unsplash.com/photo-1600679472829-3044539ce8ed?w=400&fit=crop',
      'currentClub': 'SL Benfica',
      'marketValue': 10000000,
      'aiFitScore': 0.82,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.88,
          'description': 'Modern attacking right-back with defensive awareness'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.80,
          'description': 'Thrives as an inverted full-back or overlapping wingback'
        },
        {
          'category': 'Performance',
          'score': 0.82,
          'description': '5.4 crosses per game, 2.3 tackles, 85% pass accuracy'
        },
        {
          'category': 'Availability',
          'score': 0.76,
          'description': 'Under contract until 2027, would require significant bid'
        }
      ],
      'stats': {
        'totalAppearances': 142,
        'totalGoals': 8,
        'totalAssists': 32,
        'cleanSheets': 42,
        'passAccuracy': 85.3,
        'shotAccuracy': 42.0,
        'yellowCards': 19,
        'redCards': 1
      },
      'careerHistory': [
        {
          'club': 'SL Benfica',
          'league': 'Primeira Liga',
          'country': 'Portugal',
          'period': '2023 - Present',
          'appearances': 64,
          'goals': 4,
          'assists': 18
        },
        {
          'club': 'FC Porto B',
          'league': 'Liga Portugal 2',
          'country': 'Portugal',
          'period': '2020 - 2023',
          'appearances': 78,
          'goals': 4,
          'assists': 14
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/rui-henriques',
      'isFeatured': false
    },
    {
      'id': 'p12',
      'name': 'Pablo García',
      'firstName': 'Pablo',
      'lastName': 'García',
      'position': 'CB',
      'nationality': 'Spain',
      'age': 30,
      'height': 190,
      'preferredFoot': 'Left',
      'availability': 'In Negotiation',
      'biography':
          'Pablo García is an experienced centre-back whose leadership and reading of the game have earned him a distinguished career in Spanish football. A La Masia graduate, he combines exceptional positional play with the ability to initiate attacks from deep. His left foot provides balance in the defence and his communication skills make him a natural captain on the pitch.',
      'imageUrl': 'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?w=400&fit=crop',
      'currentClub': 'Valencia CF',
      'marketValue': 7500000,
      'aiFitScore': 0.80,
      'aiFitReasons': [
        {
          'category': 'Position Match',
          'score': 0.85,
          'description': 'Left-footed centre-back — rare and valuable profile'
        },
        {
          'category': 'Tactical Fit',
          'score': 0.82,
          'description': 'La Masia trained — elite ball-playing defender'
        },
        {
          'category': 'Performance',
          'score': 0.78,
          'description': 'Consistent 90%+ pass accuracy from defence'
        },
        {
          'category': 'Availability',
          'score': 0.80,
          'description': 'Contract negotiations stalled, open to summer move'
        }
      ],
      'stats': {
        'totalAppearances': 276,
        'totalGoals': 14,
        'totalAssists': 9,
        'cleanSheets': 95,
        'passAccuracy': 91.8,
        'shotAccuracy': 50.0,
        'yellowCards': 42,
        'redCards': 2
      },
      'careerHistory': [
        {
          'club': 'Valencia CF',
          'league': 'La Liga',
          'country': 'Spain',
          'period': '2021 - Present',
          'appearances': 124,
          'goals': 6,
          'assists': 4
        },
        {
          'club': 'Real Sociedad',
          'league': 'La Liga',
          'country': 'Spain',
          'period': '2018 - 2021',
          'appearances': 98,
          'goals': 5,
          'assists': 3
        },
        {
          'club': 'FC Barcelona B',
          'league': 'Segunda División',
          'country': 'Spain',
          'period': '2015 - 2018',
          'appearances': 54,
          'goals': 3,
          'assists': 2
        }
      ],
      'highlightVideoUrl': 'https://example.com/highlights/pablo-garcia',
      'isFeatured': false
    },
  ];

  static List<Player> getAllPlayers() {
    return _playersJson.map((json) => Player.fromJson(json)).toList();
  }

  static Player? getPlayerById(String id) {
    try {
      final json = _playersJson.firstWhere((p) => p['id'] == id);
      return Player.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  static List<Player> getFeaturedPlayers() {
    return _playersJson
        .where((p) => p['isFeatured'] == true)
        .map((json) => Player.fromJson(json))
        .toList();
  }

  static List<Player> searchPlayers(String query) {
    final lowerQuery = query.toLowerCase();
    return _playersJson
        .where((p) =>
            (p['name'] as String).toLowerCase().contains(lowerQuery) ||
            (p['position'] as String).toLowerCase().contains(lowerQuery) ||
            (p['nationality'] as String).toLowerCase().contains(lowerQuery) ||
            (p['currentClub'] as String).toLowerCase().contains(lowerQuery))
        .map((json) => Player.fromJson(json))
        .toList();
  }
}
