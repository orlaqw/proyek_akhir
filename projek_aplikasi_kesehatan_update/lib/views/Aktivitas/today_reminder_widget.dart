import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/aktivitas_model.dart';
import 'past_reminders_widget.dart';

class TodayRemindersWidget extends StatelessWidget {
  final List<AktivitasModel> todayReminders;
  final Function(int) onEdit;
  final Function(int) onDelete;

  TodayRemindersWidget({
    required this.todayReminders,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    List<AktivitasModel> pastReminders = todayReminders.where((item) => item.reminderTime.isBefore(now)).toList();
    List<AktivitasModel> upcomingReminders = todayReminders.where((item) => item.reminderTime.isAfter(now) || item.reminderTime.isAtSameMomentAs(now)).toList();

    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        ...upcomingReminders.map((reminder) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey, width: 1),
                ),
                child: ListTile(
                  leading: Icon(
                    reminder.icon, size: 40.0,
                  ),
                  title: Column(
                    children: [
                      Text(reminder.judul, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(reminder.deskripsi, style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Text(DateFormat('dd MMM yyyy, EEEE, HH:mm').format(reminder.reminderTime), style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30.0,
                    ),
                    itemBuilder: (BuildContext context) {
                      return ['Edit', 'Delete'].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                          onTap: () {
                            if (choice == "Edit") {
                              onEdit(todayReminders.indexOf(reminder));
                            } else if (choice == "Delete") {
                              onDelete(todayReminders.indexOf(reminder));
                            }
                          },
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        if (pastReminders.isNotEmpty)
          PastRemindersWidget(
            pastReminders: pastReminders,
            onEdit: onEdit,
            onDelete: onDelete,
          ),
      ],
    );
  }
}