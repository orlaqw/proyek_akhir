import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/views/Aktivitas/aktivitas_view.dart';

class CardAktivitasFisik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 228, 104),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.directions_run, color: Colors.white),
        ),
        title: Text(
          'Physical Activity',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Activity: Jogging, Duration: 30 Minutes',
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AktivitasView()),
          );
        },
      ),
    );
  }
}