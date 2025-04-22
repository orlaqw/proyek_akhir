import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/bar_ml.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/minum_air_view.dart';

class CardMinumAir extends StatelessWidget {
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
            color: Color.fromARGB(255, 104, 218, 253),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.water_drop, color: Colors.white),
        ),
        title: Text(
          'Consumption of Water',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: BarMl(),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MinumAirView()),
          );
        },
      ),
    );
  }
}