// filepath: /c:/file orla/Sekolah/Ngoding/Project Flutter/ProjekAplikasiKesehatan/lib/views/MinumAir/bar_ml.dart
import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/water_provider.dart';
import 'package:provider/provider.dart';

class BarMl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final waterProvider = Provider.of<WaterProvider>(context);
    final sisaAir = waterProvider.kebutuhanAir - waterProvider.airDikonsumsi;

    return Card(
      color: Colors.white,
      elevation: 0, // Hilangkan bayangan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Water you have drunk:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              '${waterProvider.airDikonsumsi} ml',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: LinearProgressIndicator(
                value: waterProvider.airDikonsumsi / (waterProvider.kebutuhanAir > 0 ? waterProvider.kebutuhanAir : 1),
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
                minHeight: 20,
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(text: 'Approximately the minimum water needed you to drink: '),
                  TextSpan(
                    text: '${waterProvider.kebutuhanAir} ml',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(text: 'You need to drink '),
                  TextSpan(
                    text: '${sisaAir > 0 ? sisaAir : 0} ml',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(text: ' more to reach your goal.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}