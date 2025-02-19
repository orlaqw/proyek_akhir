import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/aktivitas_model.dart';

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
    return todayReminders.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: todayReminders.length,
            itemBuilder: (context, index) {
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
                        todayReminders[index].icon, size: 40.0,
                      ),
                      title: Column(
                        children: [
                          Text(todayReminders[index].judul, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(todayReminders[index].deskripsi, style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                                Text(DateFormat('dd MMM yyyy, EEEE, HH:mm').format(todayReminders[index].reminderTime), style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                                  onEdit(index);
                                } else if (choice == "Delete") {
                                  onDelete(index);
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
            },
          )
        : Center(
            child: Text("No Plan Made"),
          );
  }
}