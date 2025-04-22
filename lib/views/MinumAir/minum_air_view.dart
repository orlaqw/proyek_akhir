// filepath: /c:/file orla/Sekolah/Ngoding/Project Flutter/ProjekAplikasiKesehatan/lib/views/MinumAir/minum_air_view.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projek_aplikasi_kesehatan/Sqflite_database/helper_air_minum.dart';
import 'package:projek_aplikasi_kesehatan/models/minum_air_model.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/bar_ml.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/histori_minum_air.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/tombol_input_minum_air.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/water_provider.dart';
import 'package:projek_aplikasi_kesehatan/widgets/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class MinumAirView extends StatefulWidget {
  @override
  _MinumAirViewState createState() => _MinumAirViewState();
}

class _MinumAirViewState extends State<MinumAirView> {
  List<MinumAirModel> historiAir = [];
  TextEditingController _customMlController = TextEditingController();
  TextEditingController _bmiController = TextEditingController();
  FocusNode _bmiFocusNode = FocusNode();

  HelperMinumAir dbHelper = HelperMinumAir.instance;

  @override
  void initState() {
    super.initState();
    _loadHistoriAir();
    _loadWaterData();
    _loadWeightData();
  }

  Future<void> _loadHistoriAir() async {
    final data = await dbHelper.readAllWaterIntake();
    setState(() {
      historiAir = data;
      historiAir.sort((a, b) => b.waktu.compareTo(a.waktu));
    });
  }

  Future<void> _loadWaterData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedAirDikonsumsi = prefs.getInt('airDikonsumsi') ?? 0;
    String? savedDate = prefs.getString('lastUpdatedDate');
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (savedDate == todayDate) {
      Provider.of<WaterProvider>(context, listen: false).updateAirDikonsumsi(savedAirDikonsumsi);
    } else {
      Provider.of<WaterProvider>(context, listen: false).updateAirDikonsumsi(0);
    }
  }

  Future<void> _saveWaterData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final waterProvider = Provider.of<WaterProvider>(context, listen: false);
    await prefs.setInt('airDikonsumsi', waterProvider.airDikonsumsi);
    await prefs.setString('lastUpdatedDate', todayDate);
  }

  Future<void> _loadWeightData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double savedWeight = prefs.getDouble('weight') ?? 0;
    if (savedWeight > 0) {
      setState(() {
        _bmiController.text = savedWeight.toString();
        Provider.of<WaterProvider>(context, listen: false).updateKebutuhanAir((savedWeight * 42).toInt());
      });
    }
  }

  Future<void> _saveWeightData(double weight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('weight', weight);
  }

  Future<void> _addWater(int ml) async {
    final waterProvider = Provider.of<WaterProvider>(context, listen: false);
    waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi + ml);
    _saveWaterData();
  }

  Future<void> _removeWater(int ml) async {
    final waterProvider = Provider.of<WaterProvider>(context, listen: false);
    if (waterProvider.airDikonsumsi - ml >= 0) {
      waterProvider.updateAirDikonsumsi(waterProvider.airDikonsumsi - ml);
    }
    _saveWaterData();
  }

  Future<void> _setWater() async {
    final waterProvider = Provider.of<WaterProvider>(context, listen: false);
    final newEntry = MinumAirModel(
      jumlah: waterProvider.airDikonsumsi,
      waktu: DateTime.now(),
    );
    await dbHelper.create(newEntry);
    _loadHistoriAir();
    _saveWaterData();
  }

  Future<void> _removeHistory(int id) async {
    await dbHelper.delete(id);
    _loadHistoriAir();
  }

  void _confirmRemoveHistory(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to remove this history?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _removeHistory(id);
                Navigator.of(context).pop();
              },
              child: Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  void _calculateKebutuhanAir() {
    double weight = double.tryParse(_bmiController.text) ?? 0;
    if (weight > 0) {
      Provider.of<WaterProvider>(context, listen: false).updateKebutuhanAir((weight * 42).toInt());
      _saveWeightData(weight);
    }
  }

  Future<void> _resetWaterData() async {
    Provider.of<WaterProvider>(context, listen: false).updateAirDikonsumsi(0);
    _saveWaterData();
  }

  @override
  void dispose() {
    _customMlController.dispose();
    _bmiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<MinumAirModel> historiHariIni = historiAir.where((item) {
      DateTime waktu = item.waktu;
      return waktu.year == now.year && waktu.month == now.month && waktu.day == now.day;
    }).toList();

    List<MinumAirModel> historiLewat = historiAir.where((item) {
      DateTime waktu = item.waktu;
      return !(waktu.year == now.year && waktu.month == now.month && waktu.day == now.day);
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 104, 218, 253), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BarMl(),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _bmiController,
                    focusNode: _bmiFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Input weight (kg)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _calculateKebutuhanAir();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text('Calculate Water Needs', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 32),
                Text("Input the ml of water you have drunk today", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 32),
                TombolInputMinumAir(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _setWater,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Confirm ml drunk', style: TextStyle(color: Colors.white)),
                ),
                HistoriMinumAir(
                  historiHariIni: historiHariIni,
                  historiLewat: historiLewat,
                  confirmRemoveHistory: _confirmRemoveHistory,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(2),
    );
  }
}