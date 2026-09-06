class AppConstants {
  AppConstants._();

  static const String appName = 'Sportify';
  static const String appTagline = 'AI-Powered Football Talent Discovery';
  static const String appDescription =
      'Where players showcase their skills and clubs discover talent.';

  // ── Positions ──
  static const List<String> positions = [
    'GK',
    'CB',
    'LB',
    'RB',
    'CDM',
    'CM',
    'CAM',
    'LW',
    'RW',
    'ST',
    'CF',
  ];

  static const Map<String, String> positionFullNames = {
    'GK': 'Goalkeeper',
    'CB': 'Center Back',
    'LB': 'Left Back',
    'RB': 'Right Back',
    'CDM': 'Defensive Midfielder',
    'CM': 'Central Midfielder',
    'CAM': 'Attacking Midfielder',
    'LW': 'Left Winger',
    'RW': 'Right Winger',
    'ST': 'Striker',
    'CF': 'Center Forward',
  };

  // ── Preferred Foot ──
  static const List<String> preferredFoot = ['Left', 'Right', 'Both'];

  // ── Nationalities with flag emojis ──
  static const Map<String, String> nationalityFlags = {
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

  // ── Availability Statuses ──
  static const String availableNow = 'Available Now';
  static const String onContract = 'On Contract';
  static const String onLoan = 'On Loan';
  static const String negotiating = 'In Negotiation';
  static const String freeAgent = 'Free Agent';

  // ── AI Score Reasons ──
  static const List<String> aiScoreReasons = [
    'Position Match',
    'Tactical Fit',
    'Performance',
    'Availability',
    'Age Profile',
    'Market Value',
    'Growth Potential',
    'League Experience',
  ];
}
