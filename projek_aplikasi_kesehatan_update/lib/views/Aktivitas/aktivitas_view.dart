import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projek_aplikasi_kesehatan/Sqflite_database/helper_aktivitas.dart';
import 'package:projek_aplikasi_kesehatan/views/Aktivitas/input_widget_aktivitas.dart';
import 'package:projek_aplikasi_kesehatan/views/Aktivitas/today_reminder_widget.dart';
import 'package:projek_aplikasi_kesehatan/views/Aktivitas/upcoming_reminder_widget.dart';
import '../../controllers/aktivitas_controller.dart';
import '../../models/aktivitas_model.dart';
import '/widgets/alertdialog.dart';

class AktivitasView extends StatefulWidget {
  AktivitasView({super.key});

  @override
  State<AktivitasView> createState() => _AktivitasViewState();
}

class _AktivitasViewState extends State<AktivitasView> {
  AktivitasController aktivitasfisik = AktivitasController();
  TextEditingController deskripsiInput = TextEditingController();
  TextEditingController reminderTimeInput = TextEditingController();

  final formKey = GlobalKey<FormState>();
  InputWidgetAktivitas modal = InputWidgetAktivitas();
  alertDialog alert = alertDialog();
  HelperAktivitas dbHelper = HelperAktivitas.instance;

  List<String> listAct = ["Edit", "Delete"];
  List<AktivitasModel>? rencana;
  int? kegiatan_id;
  List<String> judulOptions = ['Weight Lifting', 'Aquatic', 'Martial Arts', 'Athletic', 'Calisthenics', 'Gymnastics', 'Ball Game', 'Other'];
  String? selectedJudul;

  @override
  void initState() {
    super.initState();
    getKegiatan();
  }

  Future<void> getKegiatan() async {
    final data = await dbHelper.readAllAktivitas();
    setState(() {
      rencana = data;
    });
  }

  Future<void> addCard(AktivitasModel data) async {
    await dbHelper.create(data);
    getKegiatan();
  }

  Future<void> updateCard(AktivitasModel data) async {
    await dbHelper.update(data);
    getKegiatan();
  }

  Future<void> deleteCard(int id) async {
    await dbHelper.delete(id);
    getKegiatan();
  }

  @override
  Widget build(BuildContext context) {
    List<AktivitasModel> todayReminders = [];
    List<AktivitasModel> upcomingReminders = [];

    if (rencana != null) {
      rencana!.sort((a, b) => a.reminderTime.compareTo(b.reminderTime));
      DateTime now = DateTime.now();
      todayReminders = rencana!.where((item) => item.reminderTime.day == now.day && item.reminderTime.month == now.month && item.reminderTime.year == now.year).toList();
      upcomingReminders = rencana!.where((item) => item.reminderTime.isAfter(now)).toList();
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 253, 228, 104), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/beranda');
            },
            child: Text(
              "Back to home",
              style: TextStyle(color: Colors.black),
            ),
          ),
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/beranda');
            },
          ),
          actions: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  kegiatan_id = null;
                  selectedJudul = null;
                  deskripsiInput.clear();
                  reminderTimeInput.clear();
                });

                modal.showFullModal(context, (data) {
                  addCard(data);
                });
              },
              child: Icon(Icons.add, color: Colors.orange),
              backgroundColor: Colors.white,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
              child: Text(
                "Activity Plan", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Today: ${DateFormat('EEEE, d MMMM y').format(DateTime.now())}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TodayRemindersWidget(
                todayReminders: todayReminders,
                onEdit: (index) {
                  setState(() {
                    kegiatan_id = todayReminders[index].id;
                    selectedJudul = todayReminders[index].judul;
                    deskripsiInput.text = todayReminders[index].deskripsi;
                    reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(todayReminders[index].reminderTime);
                  });
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    modal.showFullModal(context, (data) {
                      updateCard(data);
                    }, initialData: todayReminders[index]);
                  });
                },
                onDelete: (index) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    alert.showAlertDialog(context, () {
                      deleteCard(todayReminders[index].id!);
                    });
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Upcoming Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: UpcomingRemindersWidget(
                upcomingReminders: upcomingReminders,
                onEdit: (index) {
                  setState(() {
                    kegiatan_id = upcomingReminders[index].id;
                    selectedJudul = upcomingReminders[index].judul;
                    deskripsiInput.text = upcomingReminders[index].deskripsi;
                    reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(upcomingReminders[index].reminderTime);
                  });
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    modal.showFullModal(context, (data) {
                      updateCard(data);
                    }, initialData: upcomingReminders[index]);
                  });
                },
                onDelete: (index) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    alert.showAlertDialog(context, () {
                      deleteCard(upcomingReminders[index].id!);
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}