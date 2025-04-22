class MinumAirModel {
  int? id;
  int jumlah;
  DateTime waktu;

  MinumAirModel({
    this.id,
    required this.jumlah,
    required this.waktu,
  });

  // Convert a MinumAirModel into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'jumlah': jumlah,
      'waktu': waktu.toIso8601String(),
    };
  }

  // Convert a Map into a MinumAirModel.
  factory MinumAirModel.fromMap(Map<String, dynamic> map) {
    return MinumAirModel(
      id: map['id'],
      jumlah: map['jumlah'],
      waktu: DateTime.parse(map['waktu']),
    );
  }

  // Create a copy of the MinumAirModel with updated fields.
  MinumAirModel copy({
    int? id,
    int? jumlah,
    DateTime? waktu,
  }) {
    return MinumAirModel(
      id: id ?? this.id,
      jumlah: jumlah ?? this.jumlah,
      waktu: waktu ?? this.waktu,
    );
  }
}