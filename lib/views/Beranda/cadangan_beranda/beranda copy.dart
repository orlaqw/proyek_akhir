// import 'package:flutter/material.dart';
// import 'package:latihan_ukl_paket1android/views/Aktivitas/aktivitas_view.dart';
// import 'package:latihan_ukl_paket1android/views/MinumAir/minum_air.dart';
// import 'package:latihan_ukl_paket1android/views/PenghitungBMI/penghitung_bmi.dart'; // Import halaman penghitung BMI
// import 'package:latihan_ukl_paket1android/widgets/bottom_nav.dart';

// class Beranda extends StatefulWidget {
//   const Beranda({super.key});

//   @override
//   State<Beranda> createState() => _BerandaState();
// }

// class _BerandaState extends State<Beranda> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           // height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color.fromARGB(255, 148, 250, 120), Colors.white],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
          
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
            
//                 SizedBox(height: 35),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Image.asset(
//                     'assets/logohealthyme.png', // Ganti dengan path logo Anda
//                     height: 40,
//                     ),
//                   ),
//                   ),
//                       SizedBox(height: 30),
            
//                 Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Text("Start Living Healthy From Now On!",
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,
//                           ),
//                         ),
//                         ),
//                       ),
//                       // SizedBox(height: 10),
                          
//                       // Align(
//                       //   alignment: Alignment.center,
//                       //   child: Padding(
//                       //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       //   child: Text("Siap Untuk Memulai Hidup Sehat?",
//                       //         style: TextStyle(fontSize: 16, color: Colors.black,
//                       //         ),
//                       //       ),
//                       //   ),
//                       // ),
            
//                 IntrinsicHeight(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     margin: EdgeInsets.only(top: 50, left: 20, right: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                       // boxShadow: [
//                       //   BoxShadow(
//                       //     color: Colors.grey.withOpacity(0.5),
//                       //     spreadRadius: 5,
//                       //     blurRadius: 7,
//                       //     offset: Offset(0, 3),
//                       //   ),
//                       // ],
//                     ),
//                     child: IntrinsicHeight(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
                                    
//                             SizedBox(height: 20),
//                             Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                 border: Border(
//                                   bottom: BorderSide(
//                                   color: Colors.grey,
//                                   width: 1.0,
//                                   ),
//                                 ),
//                                 ),
//                                 child: Text(
//                                 "Your Status Service",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   // fontWeight: FontWeight.bold,
//                                   color: Colors.grey,
//                                 ),
//                                 ),
//                               ),
//                               ),
//                             ),
//                             SizedBox(height: 10),
                                
//                             ListView(
//                               padding: EdgeInsets.all(12),
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 children: [
//                                 Card(
//                                   color: Colors.transparent,
//                                   elevation: 0,
//                                   margin: EdgeInsets.symmetric(vertical: 10),
//                                   shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Colors.grey, width: 1),
//                                   borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: ListTile(
//                                   leading: Container(
//                                   padding: EdgeInsets.all(8),
//                                   decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 104, 218, 253),
//                                   borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Icon(Icons.water_drop, color: Colors.white),
//                                   ),
//                                   title: Text(
//                                   'Consumption of Water',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                   'Water Consumption Today: 2 Liters',
//                                   style: TextStyle(color: Colors.grey),
//                                   ),
//                                   onTap: () {
//                                   Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => MinumAir()), // Ganti dengan halaman yang sesuai
//                                   );
//                                   },
//                                   ),
//                                 ),

//                                 Card(
//                                   color: Colors.transparent,
//                                   elevation: 0,
//                                   margin: EdgeInsets.symmetric(vertical: 10),
//                                   shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Colors.grey, width: 1),
//                                   borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: ListTile(
//                                   leading: Container(
//                                   padding: EdgeInsets.all(8),
//                                   decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 253, 228, 104),
//                                   borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Icon(Icons.directions_run, color: Colors.white),
//                                   ),
//                                   title: Text(
//                                   'Physical Activity',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                   'Activity: Jogging, Duration: 30 Minutes',
//                                   style: TextStyle(color: Colors.grey),
//                                   ),
//                                   onTap: () {
//                                   Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => AktivitasView()),
//                                   );
//                                   },
//                                   ),
//                                 ),
//                                 Card(
//                                   color: Colors.transparent,
//                                   elevation: 0,
//                                   margin: EdgeInsets.symmetric(vertical: 10),
//                                   shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Colors.grey, width: 1),
//                                   borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: ListTile(
//                                   leading: Container(
//                                   padding: EdgeInsets.all(8),
//                                   decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 239, 129, 129),
//                                   borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Icon(Icons.monitor_weight, color: Colors.white),
//                                   ),
//                                   title: Text(
//                                   'Calculate BMI',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                   Text(
//                                   'BMI: 50',
//                                   style: TextStyle(color: Colors.grey),
//                                   ),
//                                   Text(
//                                   'Category: Obesity',
//                                   style: TextStyle(color: Colors.grey),
//                                   ),
//                                   ],
//                                   ),
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => PenghitungBmi()), // Navigasi ke halaman penghitung BMI
//                                     );
//                                   },
//                                   ),
//                                 ),
//                                 ],
                              
//                             )
                                    
                                    
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
            
//               ],
//             ),
//           ),
//         ),
//       ),

//       bottomNavigationBar: BottomNav(0),

//     );
//   }
// }