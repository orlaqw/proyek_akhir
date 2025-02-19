import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/widgets/bottom_nav.dart';
import 'package:intl/intl.dart'; // Tambahkan package intl untuk format tanggal

class MinumAir extends StatefulWidget {
  @override
  _MinumAirState createState() => _MinumAirState();
}

class _MinumAirState extends State<MinumAir> {
  int airDikonsumsi = 0; // Jumlah air yang telah dikonsumsi (dalam ml)
  int kebutuhanAir = 0; // Kebutuhan air berdasarkan BMI
  List<Map<String, dynamic>> historiAir = []; // List untuk menyimpan histori konsumsi air
  TextEditingController _customMlController = TextEditingController(); // Controller untuk input custom ml
  TextEditingController _bmiController = TextEditingController(); // Controller untuk input BMI

  void _addWater(int ml) {
    setState(() {
      airDikonsumsi += ml;
    });
  }

  void _removeWater(int ml) {
    setState(() {
      if (airDikonsumsi - ml >= 0) {
        airDikonsumsi -= ml; // Pastikan tidak bisa kurang dari 0
      }
    });
  }

  void _setWater() {
    setState(() {
      historiAir.insert(0, { // Tambahkan item baru ke awal daftar
        'jumlah': airDikonsumsi,
        'waktu': DateTime.now(),
      });
    });
  }

  void _removeHistory(int index) {
    setState(() {
      historiAir.removeAt(index);
    });
  }

  void _confirmRemoveHistory(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to remove this history?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _removeHistory(index);
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  void _calculateKebutuhanAir() {
    double bmi = double.tryParse(_bmiController.text) ?? 0;
    if (bmi > 0) {
      // Contoh perhitungan kebutuhan air berdasarkan BMI
      kebutuhanAir = (bmi * 42).toInt(); // Misalnya 35 ml per kg berat badan
    }
  }

  @override
  void dispose() {
    _customMlController.dispose(); // Dispose controller saat widget dihapus
    _bmiController.dispose(); // Dispose controller saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<Map<String, dynamic>> historiHariIni = historiAir.where((item) {
      DateTime waktu = item['waktu'];
      return waktu.year == now.year && waktu.month == now.month && waktu.day == now.day;
    }).toList();

    List<Map<String, dynamic>> historiLewat = historiAir.where((item) {
      DateTime waktu = item['waktu'];
      return !(waktu.year == now.year && waktu.month == now.month && waktu.day == now.day);
    }).toList();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Pelacak Konsumsi Air'),
      //   backgroundColor: Colors.blueAccent,
      // ),
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
                Card(
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
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '$airDikonsumsi ml',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: airDikonsumsi / (kebutuhanAir > 0 ? kebutuhanAir : 1),
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                          minHeight: 20,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Approximately the minimum water needed to drink: $kebutuhanAir ml',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _bmiController,
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
                    setState(() {}); // Update UI setelah menghitung kebutuhan air
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _addWater(250), // Tambah 250 ml
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 104, 218, 253),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('+250 ml', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () => _addWater(500), // Tambah 500 ml
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 104, 218, 253),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('+500 ml', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () => _removeWater(250), // Kurangi 250 ml
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
                        controller: _customMlController,
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
                        int customMl = int.tryParse(_customMlController.text) ?? 0;
                        if (customMl > 0) {
                          _addWater(customMl);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 104, 218, 253),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Add ml', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _setWater, // Set jumlah air ke histori
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text('Set', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Reset jumlah air
                        setState(() {
                          airDikonsumsi = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 239, 129, 129),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text('Reset', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                // SizedBox(height: 25),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 1.2, // Atur lebar container putih
                    height: MediaQuery.of(context).size.height * 0.7,
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 5,
                      //     blurRadius: 7,
                      //     offset: Offset(0, 3),
                      //   ),
                      // ],
                    ),
                    child: IntrinsicHeight(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Water Consumption History",
                                    style: TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            historiHariIni.isEmpty
                                ? Text("History Empty", style: TextStyle(fontSize: 16, color: Colors.grey))
                                : Column(
                                    children: historiHariIni.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      int jumlah = entry.value['jumlah'];
                                      DateTime waktu = entry.value['waktu'];
                                      String formattedDate = DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(waktu);
                                      return Card(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: ListTile(
                                            title: Text('$jumlah ml'),
                                            subtitle: Text(formattedDate),
                                            trailing: IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () => _confirmRemoveHistory(index),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                            SizedBox(height: 10),
                            Text(
                              "Before",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            historiLewat.isEmpty
                                ? Text("History Empty", style: TextStyle(fontSize: 16, color: Colors.grey))
                                : Column(
                                    children: historiLewat.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      int jumlah = entry.value['jumlah'];
                                      DateTime waktu = entry.value['waktu'];
                                      String formattedDate = DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(waktu);
                                      return Card(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: ListTile(
                                            title: Text('$jumlah ml'),
                                            subtitle: Text(formattedDate),
                                            trailing: IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () => _confirmRemoveHistory(index),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
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