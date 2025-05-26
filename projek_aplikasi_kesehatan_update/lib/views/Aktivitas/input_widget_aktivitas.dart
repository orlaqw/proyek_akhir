import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/aktivitas_model.dart';

class InputWidgetAktivitas {
  showFullModal(context, Function(AktivitasModel) onSave, {AktivitasModel? initialData}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Edit", // label for barrier
      transitionDuration: Duration(milliseconds: 250), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Plan Activities",
              style: TextStyle(color: Colors.black, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0,
          ),
          backgroundColor: Colors.white.withOpacity(0.90),
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: const Color(0xfff8f8f8),
                  width: 1,
                ),
              ),
            ),
            child: InputFormWidget(onSave: onSave, initialData: initialData),
          ),
        );
      },
    );
  }
}

class InputFormWidget extends StatefulWidget {
  final Function(AktivitasModel) onSave;
  final AktivitasModel? initialData;

  InputFormWidget({required this.onSave, this.initialData});

  @override
  _InputFormWidgetState createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController deskripsiInput = TextEditingController();
  TextEditingController reminderTimeInput = TextEditingController();
  String? selectedJudul;
  DateTime? selectedDateTime;
  IconData? selectedIcon;

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      deskripsiInput.text = widget.initialData!.deskripsi;
      reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(widget.initialData!.reminderTime);
      selectedJudul = widget.initialData!.judul;
      selectedDateTime = widget.initialData!.reminderTime;
      selectedIcon = widget.initialData!.icon;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, IconData> activityIcons = {
      'Weight Lifting': Icons.fitness_center,
      'Aquatic': Icons.pool,
      'Martial Arts': Icons.sports_mma,
      'Athletic': Icons.directions_run,
      'Calisthenics': Icons.accessibility_new,
      'Gymnastics': Icons.sports_gymnastics,
      'Ball Game': Icons.sports_soccer,
      'Other': Icons.more_horiz,
    };

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Organize Your Activities and Time"),
          DropdownButtonFormField<String>(
            value: selectedJudul,
            hint: Text("Select Activity"),
            items: activityIcons.keys.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(activityIcons[value]),
                    SizedBox(width: 10),
                    Text(value),
                  ],
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedJudul = newValue;
                selectedIcon = activityIcons[newValue!];
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Required';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: deskripsiInput,
            decoration: InputDecoration(label: Text("Activity Description")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: reminderTimeInput,
            readOnly: true,
            decoration: InputDecoration(label: Text("Reminder Time")),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  setState(() {
                    selectedDateTime = DateTime(
                      pickedDate.year,
                      pickedDate.month,
                      pickedDate.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                    reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(selectedDateTime!);
                  });
                }
              }
            },
            validator: (value) {
              if (selectedDateTime == null) {
                return 'Required';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (selectedJudul == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Activities Must Be Selected')),
                  );
                  return;
                }

                AktivitasModel data = AktivitasModel(
                  id: widget.initialData?.id ?? DateTime.now().millisecondsSinceEpoch,
                  judul: selectedJudul!,
                  deskripsi: deskripsiInput.text,
                  reminderTime: selectedDateTime!,
                  icon: selectedIcon!,
                );
                widget.onSave(data);
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 253, 228, 104)),
            child: Text(
              "Set",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}