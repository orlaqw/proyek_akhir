import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/aktivitas_model.dart';

class UpcomingRemindersWidget extends StatelessWidget {
  final List<AktivitasModel> upcomingReminders;
  final Function(int) onEdit;
  final Function(int) onDelete;

  UpcomingRemindersWidget({
    required this.upcomingReminders,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return upcomingReminders.isNotEmpty
        ? SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: upcomingReminders.map((reminder) {
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
                                    onEdit(upcomingReminders.indexOf(reminder));
                                  } else if (choice == "Delete") {
                                    onDelete(upcomingReminders.indexOf(reminder));
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
            ),
          )
        : Center(
            child: Text("No Plan Made"),
          );
  }
}