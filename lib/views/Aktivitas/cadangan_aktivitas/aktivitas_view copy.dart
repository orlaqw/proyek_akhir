// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:latihan_ukl_paket1android/widgets/alertdialog.dart';
// import '../../controllers/aktivitas_controller.dart';
// import '../../models/aktivitas_model.dart';
// import '/widgets/modal_widget.dart';

// class AktivitasView extends StatefulWidget {
//   AktivitasView({super.key});

//   @override
//   State<AktivitasView> createState() => _AktivitasViewState();
// }

// class _AktivitasViewState extends State<AktivitasView> {
//   AktivitasController aktivitasfisik = AktivitasController();
//  //controller untuk mengambil data dari form, TextEditingController() untuk input
//   TextEditingController deskripsiInput = TextEditingController();
//   TextEditingController reminderTimeInput = TextEditingController();

//   final formKey = GlobalKey<FormState>(); //final formKey untuk validasi form, data username, password dll diapit oleh form, 
//   ModalWidget modal = ModalWidget();
//   alertDialog alert = alertDialog();

//   List<String> listAct = ["Edit", "Delete"];
//   List<AktivitasModel>? rencana;
//   int? kegiatan_id;
//   List<String> judulOptions = ['Weight Lifting', 'Aquatic', 'Martial Arts', 'Athletic', 'Calisthenics', 'Gymnastics', 'Ball Game', 'Other'];
//   String? selectedJudul;

//   getKegiatan() {
//     setState(() { //setstate untuk mereload data setiap membuka halamannya, menggunakan setState agar menyimpan data secara realtime
//       rencana = aktivitasfisik.aktivitas; //rencana untuk menyimpan data dari aktivitasfisik dan aktivitas
//     });
//   }

//   addCard(data) {
//     rencana!.add(data);
//     getKegiatan();
//   }

//   @override
//   void initState() { //initState untuk menjalankan skrip di awal membuka, untuk memanggil getFilm
//     // TODO: implement initState
//     super.initState();
//     getKegiatan();
//   }

//   @override
//   Widget build(BuildContext context) {

//     List<AktivitasModel> todayReminders = [];
//     List<AktivitasModel> upcomingReminders = [];
//     // List<AktivitasModel> checkedReminders = [];

//     if (rencana != null) {
//       rencana!.sort((a, b) => a.reminderTime.compareTo(b.reminderTime));
//       DateTime now = DateTime.now();
//       todayReminders = rencana!.where((item) => item.reminderTime.day == now.day && item.reminderTime.month == now.month && item.reminderTime.year == now.year).toList();
//       upcomingReminders = rencana!.where((item) => item.reminderTime.isAfter(now)).toList();
//       // checkedReminders = rencana!.where((item) => item.isChecked).toList(); // Filter card yang dicentang
//     }

//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color.fromARGB(255, 253, 228, 104), Colors.white],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),

//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent, //mentransparantkan appbar agar warna terlihat dari warna container sebagai background
//           title: Text("Activity", style: TextStyle(color: Colors.black)),
//           // backgroundColor: Colors.green,
//           foregroundColor: Colors.white,
//           actions: [
            
//             FloatingActionButton(
//               onPressed: () {
//                 setState(() {
//                   kegiatan_id = null; // null agar dikosongi
//                   selectedJudul = null; // Reset selectedJudul
//                   deskripsiInput.clear(); // Clear deskripsiInput
//                   reminderTimeInput.clear(); // Clear reminderTimeInput
//                 });

//                 modal.showFullModal(context, fromTambah(null));
//               },
//               child: Icon(Icons.add, color: Color.fromARGB(255, 253, 228, 104)),
//               backgroundColor: Colors.white,
//             )

//           ],
      
//         ),
      
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               'Today: ${DateFormat('EEEE, d MMMM y').format(DateTime.now())}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),

//             Expanded(
//               child: todayReminders.isNotEmpty
//                   ? ListView.builder(
//                       padding: EdgeInsets.all(12),
//                       itemCount: todayReminders.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
              
//                           children: [
            
//                             Card(
//                               color: Colors.white,

//                               child: ListTile(

//                                 leading: Icon(
//                                   todayReminders[index].icon, size: 40.0,
//                                 ),

//                                 title: Column(

//                                   children: [

//                                     Text(todayReminders[index].judul, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [

//                                               Text(todayReminders[index].deskripsi, style: TextStyle(fontSize: 12)),
                                            
                                            
//                                             ],
//                                           ),
//                                           Text(DateFormat('dd MMM yyyy, EEEE, HH:mm').format(todayReminders[index].reminderTime), style: TextStyle(fontSize: 12, color: Colors.grey)),
//                                         ],
//                                       ),
//                                     ),

//                                   ],
//                                 ),

//                                 trailing: PopupMenuButton<String>(
//                                   icon: const Icon(
//                                     Icons.more_vert,
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     size: 30.0,
//                                   ),
                                  
//                                   itemBuilder: (BuildContext context) {
//                                     return listAct.map((String choice) {
//                                       return PopupMenuItem<String>(
//                                         value: choice,
//                                         child: Text(choice),
//                                         onTap: () {
//                                           if (choice == "Edit") {
//                                             setState(() {
//                                               kegiatan_id = todayReminders[index].id;
//                                               selectedJudul = todayReminders[index].judul;
//                                               deskripsiInput.text = todayReminders[index].deskripsi;
//                                               reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(todayReminders[index].reminderTime);
//                                             });
//                                             WidgetsBinding.instance.addPostFrameCallback((_) {
//                                               modal.showFullModal(context, fromTambah(index));
//                                             });
//                                             } else if (choice == "Delete") {
//                                               WidgetsBinding.instance.addPostFrameCallback((_) {
//                                                 alert.showAlertDialog(context, () {
//                                                   setState(() {
//                                                     aktivitasfisik.aktivitas.removeWhere((item) => item.id == todayReminders[index].id);
//                                                     getKegiatan();
//                                                   });
//                                                 });
//                                               });
//                                             }
//                                         },
//                                       );
//                                     }).toList();
//                                   },
//                                 ),
//                               ),
//                             ),
      
//                           ],
//                         );
//                       }
//                     )

//                     :Center(
//                       child: Text("No Plan Made"),
//                     ),
//             ),

//             Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               'Upcoming Activity',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),

//           Expanded(
//             child: upcomingReminders.isNotEmpty
//                 ? ListView.builder(
//                     padding: EdgeInsets.all(12),
//                     itemCount: upcomingReminders.length,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Card(
//                             color: Colors.white,
//                             child: ListTile(

//                               leading: Icon(
//                                   upcomingReminders[index].icon, size: 40.0,
//                                 ),

//                               title: Column(

//                                   children: [

//                                     Text(upcomingReminders[index].judul, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [

//                                               Text(upcomingReminders[index].deskripsi, style: TextStyle(fontSize: 12)),
                                            
                                            
//                                             ],
//                                           ),
//                                           Text(DateFormat('dd MMM yyyy, EEEE, HH:mm').format(upcomingReminders[index].reminderTime), style: TextStyle(fontSize: 12, color: Colors.grey)),
//                                         ],
//                                       ),
//                                     ),

//                                   ],
//                                 ),

//                               trailing: PopupMenuButton<String>(
//                                 icon: const Icon(
//                                   Icons.more_vert,
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   size: 30.0,
//                                 ),
//                                 itemBuilder: (BuildContext context) {
//                                   return listAct.map((String choice) {
//                                     return PopupMenuItem<String>(
//                                       value: choice,
//                                       child: Text(choice),
//                                       onTap: () {
//                                         if (choice == "Edit") {
//                                           setState(() {
//                                               kegiatan_id = upcomingReminders[index].id;
//                                               selectedJudul = upcomingReminders[index].judul;
//                                               deskripsiInput.text = upcomingReminders[index].deskripsi;
//                                               reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(upcomingReminders[index].reminderTime);
//                                             });
//                                             WidgetsBinding.instance.addPostFrameCallback((_) {
//                                               modal.showFullModal(context, fromTambah(index));
//                                             });
//                                             } else if (choice == "Delete") {
//                                               WidgetsBinding.instance.addPostFrameCallback((_) {
//                                                 alert.showAlertDialog(context, () {
//                                                   setState(() {
//                                                     aktivitasfisik.aktivitas.removeWhere((item) => item.id == upcomingReminders[index].id);
//                                                     getKegiatan();
//                                                   });
//                                                 });
//                                               });
//                                             }
//                                       },
//                                     );
//                                   }).toList();
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     })
//                 : Center(
//                     child: Text("No Plan Made"),
//                   ),
//           ),

// //           if (checkedReminders.isNotEmpty) ...[
// //   Padding(
// //     padding: const EdgeInsets.all(12.0),
// //     child: Text(
// //       'Completed Activities',
// //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //     ),
// //   ),
// //   Expanded(
// //     child: ListView.builder(
// //       padding: EdgeInsets.all(12),
// //       itemCount: checkedReminders.length,
// //       itemBuilder: (context, index) {
// //         return Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [

// //             Card(
// //               color: Colors.white,
// //               child: ListTile(
// //                 leading: Icon(
// //                   todayReminders[index].icon, size: 40.0,
// //                 ),

// //                 title: Column(
// //                   children: [
// //                     Text(checkedReminders[index].judul, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
// //                     Align(
// //                       alignment: Alignment.centerLeft,
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [

// //                               Text(checkedReminders[index].deskripsi, style: TextStyle(fontSize: 12)),
                            
// //                               // Checkbox(
// //                               //   value: checkedReminders[index].isChecked,
// //                               //   onChanged: (bool? value) {
// //                               //     setState(() {
// //                               //       checkedReminders[index].isChecked = value!;
// //                               //       getKegiatan();
// //                               //     });
// //                               //   },
// //                               // ),
                            
// //                             ],
// //                           ),
// //                           Text(DateFormat('dd MMM yyyy, EEEE, HH:mm').format(checkedReminders[index].reminderTime), style: TextStyle(fontSize: 12, color: Colors.grey)),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 trailing: PopupMenuButton<String>(
// //                   icon: const Icon(
// //                     Icons.more_vert,
// //                     color: Color.fromARGB(255, 0, 0, 0),
// //                     size: 30.0,
// //                   ),
// //                   itemBuilder: (BuildContext context) {
// //                     return listAct.map((String choice) {
// //                       return PopupMenuItem<String>(
// //                         value: choice,
// //                         child: Text(choice),
// //                         onTap: () {
// //                           if (choice == "Edit") {
// //                             setState(() {
// //                               kegiatan_id = checkedReminders[index].id;
// //                               selectedJudul = checkedReminders[index].judul;
// //                             });
// //                             deskripsiInput.text = checkedReminders[index].deskripsi;
// //                             modal.showFullModal(context, fromTambah(index));
// //                           } else if (choice == "Delete") {
// //                             alert.showAlertDialog(context, () {
// //                               aktivitasfisik.aktivitas.removeWhere(
// //                                   (item) => item.id == checkedReminders[index].id);
// //                               getKegiatan();
// //                             });
// //                           }
// //                         },
// //                       );
// //                     }).toList();
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     ),
// //   ),
// // ],

//           ],
//         ),
//       ),
//     );
//   }

// Widget fromTambah(index) {
//   DateTime? selectedDateTime = index != null ? rencana![index].reminderTime : null;
//   IconData? selectedIcon = index != null ? rencana![index].icon : null;

//   Map<String, IconData> activityIcons = {
//     'Weight Lifting': Icons.fitness_center,
//     'Aquatic': Icons.pool,
//     'Martial Arts': Icons.sports_mma,
//     'Athletic': Icons.directions_run,
//     'Calisthenics': Icons.accessibility_new,
//     'Gymnastics': Icons.sports_gymnastics,
//     'Ball Game': Icons.sports_soccer,
//     'Other': Icons.more_horiz,
//   };

//   return Form(
//     key: formKey,
//     child: Column(
//       children: [
//         Text("Organize Your Activities and Time"),

//         DropdownButtonFormField<String>(
//           value: selectedJudul,
//           hint: Text("Select Activity"),
//           items: judulOptions.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Row(
//                 children: [
//                   Icon(activityIcons[value]), // Display the icon
//                   SizedBox(width: 10),
//                   Text(value),
//                 ],
//               ),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             setState(() {
//               selectedJudul = newValue;
//               selectedIcon = activityIcons[newValue!];
              
//             });
//           },
          
//           validator: (value) {
//             if (value == null) {
//               return 'Required';
//             } else {
//               return null;
//             }
//           },
//         ),
          
//         TextFormField(
//           controller: deskripsiInput, //variabel untuk menyimpan dari yang diketik
//           decoration: InputDecoration(label: Text("Activity Description")),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'Required'; //jika kosong akan muncul pesan 'harus diisi'
//             } else {
//               return null;
//             }
//           },
//         ),

//         TextFormField(
//             controller: reminderTimeInput,
//             readOnly: true,
//             decoration: InputDecoration(label: Text("Reminder Time")),
//             onTap: () async {
//               DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime.now(),
//                 lastDate: DateTime(2101),
//               );

//               if (pickedDate != null) {
//                 TimeOfDay? pickedTime = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now(),
//                 );

//                 if (pickedTime != null) {
//                   setState(() {
//                     selectedDateTime = DateTime(
//                       pickedDate.year,
//                       pickedDate.month,
//                       pickedDate.day,
//                       pickedTime.hour,
//                       pickedTime.minute,
//                     );
//                     reminderTimeInput.text = DateFormat('dd MMM yyyy, EEEE, HH:mm').format(selectedDateTime!);
//                   });
//                 }
//               }
//             },
//             validator: (value) {
//               if (selectedDateTime == null) {
//                 return 'Required';
//               } else {
//                 return null;
//               }
//             },
//           ),
          
//           SizedBox(height: 20,),

//           ElevatedButton(
//             onPressed: () {
//               if (formKey.currentState!.validate()) {
//                 if (selectedJudul == null) { // Tampilkan pesan error jika selectedJudul null
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Activities Must Be Selected')),
//                   );
//                 return;
//                 }

//       if (index != null) {
//         rencana![index].id = kegiatan_id!; //film index id diganti jadi buku_id,
//         rencana![index].judul = selectedJudul!;
//         rencana![index].deskripsi = deskripsiInput.text;
//         rencana![index].reminderTime = selectedDateTime!;
//         rencana![index].icon = selectedIcon!;
//         getKegiatan(); // getfilm untuk data diupdate, dirubah dan tersimpan, mereload data
//       } else {
//         kegiatan_id = rencana!.length + 1; //film id int karena bisa ditambah, semua text adalah string
//         AktivitasModel data = AktivitasModel(
//           id: kegiatan_id!,
//           judul: selectedJudul!,
//           deskripsi: deskripsiInput.text,
//           reminderTime: selectedDateTime!,
//           icon: selectedIcon!,
//         );
//         addCard(data); //data disimpan ke dalam parameter
//       }
//       Navigator.pop(context); //pop adalah menghilangkan jika push menampilkan
//     }
//   },
//   style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 253, 228, 104),),
//   child: Text(
//     "Set",
//     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//   ),
// ),
//         ],
//       ),
//     );
//   }
// }