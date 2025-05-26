import 'package:flutter/material.dart';

class AktivitasModel {
  int? id;
  String judul;
  String deskripsi;
  DateTime reminderTime;
  IconData icon;

  AktivitasModel({
    this.id,
    required this.judul,
    required this.deskripsi,
    required this.reminderTime,
    required this.icon,
  });

  // Convert a AktivitasModel into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'reminderTime': reminderTime.toIso8601String(),
      'icon': icon.codePoint,
    };
  }

  // Convert a Map into a AktivitasModel.
  factory AktivitasModel.fromMap(Map<String, dynamic> map) {
    return AktivitasModel(
      id: map['id'],
      judul: map['judul'],
      deskripsi: map['deskripsi'],
      reminderTime: DateTime.parse(map['reminderTime']),
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
    );
  }

  // Create a copy of the AktivitasModel with updated fields.
  AktivitasModel copy({
    int? id,
    String? judul,
    String? deskripsi,
    DateTime? reminderTime,
    IconData? icon,
  }) {
    return AktivitasModel(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      reminderTime: reminderTime ?? this.reminderTime,
      icon: icon ?? this.icon,
    );
  }
}