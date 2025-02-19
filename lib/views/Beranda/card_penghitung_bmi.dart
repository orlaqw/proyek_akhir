import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/views/PenghitungBMI/penghitung_bmi.dart';

class CardPenghitungBmi extends StatelessWidget {
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
            color: Color.fromARGB(255, 239, 129, 129),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.monitor_weight, color: Colors.white),
        ),
        title: Text(
          'Calculate BMI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BMI: 50',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Category: Obesity',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PenghitungBmi()),
          );
        },
      ),
    );
  }
}