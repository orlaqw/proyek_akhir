class PenghitungBmiModel {
  int? id;
  String result;
  String category;
  int icon;
  int color;

  PenghitungBmiModel({
    this.id,
    required this.result,
    required this.category,
    required this.icon,
    required this.color,
  });

  // Convert a BmiModel into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'result': result,
      'category': category,
      'icon': icon,
      'color': color,
    };
  }

  // Convert a Map into a BmiModel.
  factory PenghitungBmiModel.fromMap(Map<String, dynamic> map) {
    return PenghitungBmiModel(
      id: map['id'],
      result: map['result'],
      category: map['category'],
      icon: map['icon'],
      color: map['color'],
    );
  }

  // Create a copy of the BmiModel with updated fields.
  PenghitungBmiModel copy({
    int? id,
    String? result,
    String? category,
    int? icon,
    int? color,
  }) {
    return PenghitungBmiModel(
      id: id ?? this.id,
      result: result ?? this.result,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }
}