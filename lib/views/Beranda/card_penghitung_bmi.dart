import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/Sqflite_database/helper_penghitung_bmi.dart';
import 'package:projek_aplikasi_kesehatan/models/penghitung_bmi_model.dart';
import 'package:projek_aplikasi_kesehatan/views/PenghitungBMI/penghitung_bmi_view.dart';

class CardPenghitungBmi extends StatefulWidget {
  @override
  _CardPenghitungBmiState createState() => _CardPenghitungBmiState();
}

class _CardPenghitungBmiState extends State<CardPenghitungBmi> {
  PenghitungBmiModel? _latestBmi;
  final HelperPenghitungBmi dbHelper = HelperPenghitungBmi.instance;

  @override
  void initState() {
    super.initState();
    _loadLatestBmi();
  }

  Future<void> _loadLatestBmi() async {
    final latestBmi = await dbHelper.readLatestBmi();
    setState(() {
      _latestBmi = latestBmi;
    });
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
              'Your Latest BMI',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
            ),
            ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 129, 129),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.monitor_weight_rounded,
                color: Colors.white,
              ),
            ),
            title: Text(
              _latestBmi != null ? 'BMI: ${_latestBmi!.result}' : 'No BMI Data',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Text(
                  _latestBmi != null ? 'Category: ${_latestBmi!.category}' : 'No BMI Data',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 3),
                Icon(
                  _latestBmi != null
                      ? IconData(_latestBmi!.icon, fontFamily: 'MaterialIcons')
                      : Icons.help_outline,
                  color: _latestBmi != null ? Color(_latestBmi!.color) : Colors.grey,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PenghitungBmiView()),
              );
            },
          ),
        ],
      ),
    );
  }
}