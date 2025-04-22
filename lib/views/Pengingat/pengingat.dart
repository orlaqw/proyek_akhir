import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/water_provider.dart';
import 'package:projek_aplikasi_kesehatan/views/Aktivitas/aktivitas_view.dart'; // Import halaman AktivitasView
import 'package:projek_aplikasi_kesehatan/models/aktivitas_model.dart'; // Import model AktivitasModel
import 'package:projek_aplikasi_kesehatan/controllers/aktivitas_controller.dart'; // Import controller AktivitasController
import 'package:provider/provider.dart';
import 'package:projek_aplikasi_kesehatan/widgets/bottom_nav.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/minum_air_view.dart'; // Import halaman MinumAirView
import 'package:intl/intl.dart'; // Import intl untuk DateFormat

class Pengingat extends StatefulWidget {
  const Pengingat({super.key});

  @override
  State<Pengingat> createState() => _PengingatState();
}

class _PengingatState extends State<Pengingat> {
  AktivitasController aktivitasController = AktivitasController();
  List<AktivitasModel> todayReminders = [];
  List<AktivitasModel> upcomingReminders = [];

  @override
  void initState() {
    super.initState();
    _loadAktivitas();
  }

  Future<void> _loadAktivitas() async {
    final data = await aktivitasController.getAllAktivitas();
    setState(() {
      DateTime now = DateTime.now();
      todayReminders = data.where((item) => 
        item.reminderTime.day == now.day && 
        item.reminderTime.month == now.month && 
        item.reminderTime.year == now.year && 
        item.reminderTime.isAfter(now)
      ).toList();
      upcomingReminders = data.where((item) => 
        !(item.reminderTime.day == now.day && 
        item.reminderTime.month == now.month && 
        item.reminderTime.year == now.year) && 
        item.reminderTime.isAfter(now)
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final waterProvider = Provider.of<WaterProvider>(context);
    final sisaAir = waterProvider.kebutuhanAir - waterProvider.airDikonsumsi;

    // Sort todayReminders by time to get the closest upcoming activity
    todayReminders.sort((a, b) => a.reminderTime.compareTo(b.reminderTime));

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 148, 250, 120), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNav(1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              if (waterProvider.airDikonsumsi < waterProvider.kebutuhanAir)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MinumAirView()), // Navigasi ke halaman MinumAirView
                    );
                  },
                  child: Card(
                    color: Colors.white, // Set warna Card menjadi putih
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 104, 218, 253), // Warna container
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.local_drink,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reminder to Drink Water',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(text: 'You have only drunk '),
                                      TextSpan(
                                        text: '${waterProvider.airDikonsumsi} ml',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      TextSpan(text: ' of water today. You need to drink '),
                                      TextSpan(
                                        text: '${sisaAir} ml',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      TextSpan(text: ' more to reach your goal.'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (todayReminders.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AktivitasView()), // Navigasi ke halaman AktivitasView
                    );
                  },
                  child: Card(
                    color: Colors.white, // Set warna Card menjadi putih
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 253, 228, 104), // Warna container
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.fitness_center,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reminder for Today\'s Activity',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(text: 'Your next activity is '),
                                      TextSpan(
                                        text: '${todayReminders.first.judul}',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                      TextSpan(text: ' at '),
                                      TextSpan(
                                        text: '${DateFormat('HH:mm').format(todayReminders.first.reminderTime)}',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      TextSpan(text: '. You have '),
                                      TextSpan(
                                        text: '${todayReminders.length} activities today.',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (upcomingReminders.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AktivitasView()), // Navigasi ke halaman AktivitasView
                    );
                  },
                  child: Card(
                    color: Colors.white, // Set warna Card menjadi putih
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 253, 104, 104), // Warna container
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upcoming Activity Reminder',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(text: 'Your next activity is '),
                                      TextSpan(
                                        text: '${upcomingReminders.first.judul}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      TextSpan(text: ' at '),
                                      TextSpan(
                                        text: '${DateFormat('HH:mm').format(upcomingReminders.first.reminderTime)}',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      TextSpan(text: '.'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              // Tambahkan konten lain di sini
            ],
          ),
        ),
      ),
    );
  }
}