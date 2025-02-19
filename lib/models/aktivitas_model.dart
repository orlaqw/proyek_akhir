import 'package:flutter/material.dart';

class AktivitasModel{ //untuk menyimpan data
  int id;
  String judul; //tipe data
  String deskripsi; 
  DateTime reminderTime; // Tambahkan ini
  IconData icon;
  bool isChecked;

   //tanda tanya memperbolehkan null, jika sudah ada tanda tanya tidak perlu required
  AktivitasModel({ //constructor
    required this.id, 
    required this.judul, 
    required this.deskripsi, 
    required this.reminderTime, 
    required this.icon,
    this.isChecked = false,
    
    }); //constructor, jika memanggil Movie harus ada parameter. Jika ada yang memanggil Movie, yang memanggil harus menyertakan int, string, bool, string, voteAverage
  // required agar tidak boleh null
}