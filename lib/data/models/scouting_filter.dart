class ScoutingFilter {
  final String? position;
  final double minAge;
  final double maxAge;
  final String? preferredFoot;
  final double maxBudget;

  const ScoutingFilter({
    this.position,
    this.minAge = 16,
    this.maxAge = 40,
    this.preferredFoot,
    this.maxBudget = 200,
  });

  ScoutingFilter copyWith({
    String? position,
    double? minAge,
    double? maxAge,
    String? preferredFoot,
    double? maxBudget,
  }) {
    return ScoutingFilter(
      position: position ?? this.position,
      minAge: minAge ?? this.minAge,
      maxAge: maxAge ?? this.maxAge,
      preferredFoot: preferredFoot ?? this.preferredFoot,
      maxBudget: maxBudget ?? this.maxBudget,
    );
  }

  String get budgetFormatted {
    if (maxBudget >= 1) {
      return '€${maxBudget.toStringAsFixed(0)}M';
    }
    return '€${(maxBudget * 1000).toStringAsFixed(0)}K';
  }

  factory ScoutingFilter.fromJson(Map<String, dynamic> json) {
    return ScoutingFilter(
      position: json['position'] as String?,
      minAge: (json['minAge'] as num?)?.toDouble() ?? 16,
      maxAge: (json['maxAge'] as num?)?.toDouble() ?? 40,
      preferredFoot: json['preferredFoot'] as String?,
      maxBudget: (json['maxBudget'] as num?)?.toDouble() ?? 100,
    );
  }

  Map<String, dynamic> toJson() => {
    'position': position,
    'minAge': minAge,
    'maxAge': maxAge,
    'preferredFoot': preferredFoot,
    'maxBudget': maxBudget,
  };
}
