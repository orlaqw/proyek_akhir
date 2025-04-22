// filepath: /c:/file orla/Sekolah/Ngoding/Project Flutter/ProjekAplikasiKesehatan/lib/views/MinumAir/tombol_input_minum_air.dart
import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/water_provider.dart';
import 'package:provider/provider.dart';

class TombolInputMinumAir extends StatelessWidget {
  final TextEditingController customMlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final waterProvider = Provider.of<WaterProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi + 250),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 104, 218, 253),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('+250 ml', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () => waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi + 500),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 104, 218, 253),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('+500 ml', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () => waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi - 250),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 239, 129, 129),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('-250 ml', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 225,
              child: TextField(
                controller: customMlController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Custom ml of water',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                waterProvider.updateAirDikonsumsi(0); // Reset airDikonsumsi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Reset', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                int customMl = int.tryParse(customMlController.text) ?? 0;
                if (customMl > 0) {
                  waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi + customMl);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 104, 218, 253),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text('Add ml', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                int customMl = int.tryParse(customMlController.text) ?? 0;
                if (customMl > 0) {
                  waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi - customMl);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 239, 129, 129),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text('Reduce ml', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}