import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projek_aplikasi_kesehatan/models/aktivitas_model.dart';
import 'package:projek_aplikasi_kesehatan/controllers/aktivitas_controller.dart';
import 'package:projek_aplikasi_kesehatan/views/Aktivitas/aktivitas_view.dart';

class CardAktivitasFisik extends StatefulWidget {
  @override
  _CardAktivitasFisikState createState() => _CardAktivitasFisikState();
}

class _CardAktivitasFisikState extends State<CardAktivitasFisik> {
  final AktivitasController _aktivitasController = AktivitasController();
  AktivitasModel? _nearestAktivitas;
  AktivitasModel? _upcomingAktivitas;

  @override
  void initState() {
    super.initState();
    _loadAktivitas();
  }

  Future<void> _loadAktivitas() async {
    final data = await _aktivitasController.getAllAktivitas();
    setState(() {
      _nearestAktivitas = _getNearestAktivitas(data);
      _upcomingAktivitas = _getUpcomingAktivitas(data);
    });
  }

  AktivitasModel? _getNearestAktivitas(List<AktivitasModel> aktivitasList) {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    for (var aktivitas in aktivitasList) {
      if (aktivitas.reminderTime.isAfter(startOfDay) && aktivitas.reminderTime.isBefore(endOfDay)) {
        return aktivitas;
      }
    }
    return null;
  }

  AktivitasModel? _getUpcomingAktivitas(List<AktivitasModel> aktivitasList) {
    DateTime now = DateTime.now();
    aktivitasList.sort((a, b) => a.reminderTime.compareTo(b.reminderTime));
    for (var aktivitas in aktivitasList) {
      if (aktivitas.reminderTime.isAfter(now)) {
        return aktivitas;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    AktivitasModel? aktivitasToShow = _nearestAktivitas ?? _upcomingAktivitas;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (aktivitasToShow == null)
          Card(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Plan Activity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 228, 104),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.directions_run, color: Colors.white),
                  ),
                  title: Text(
                    'No Activity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No plan activity',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AktivitasView()),
                    );
                  },
                ),
              ],
            ),
          )
        else
          Card(
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
                      'Plan Activity',
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
                      color: Color.fromARGB(255, 253, 228, 104),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(aktivitasToShow.icon, color: Colors.white),
                  ),
                  title: Text(
                    aktivitasToShow == _nearestAktivitas
                        ? aktivitasToShow.judul + ' Activity'
                        : 'Upcoming Activity: ' + aktivitasToShow.judul,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description: ${aktivitasToShow.deskripsi}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Date: ${DateFormat('dd MMM yyyy, EEEE, HH:mm').format(aktivitasToShow.reminderTime)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AktivitasView()),
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}