import 'package:flutter/material.dart';
import '/views/home_view.dart';
import '/views/login_view.dart';
import '/views/perpus_view.dart';
import '/views/profile_view.dart';
import '/views/transaksi_view.dart';

void main() {
  runApp(const MyApp()); //runApp untuk memanggil return MaterialApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/perpus', //initial route adalah awal yg terbuka
      routes: { //routing untuk menentukan alamat halaman bisadisebut url
        '/': (context) => HomeView(),
        '/login': (context) => LoginView(),
        '/transaksi': (context) => TransaksiView(),
        '/profile': (context) => ProfileView(),
        '/perpus': (context) => PerpusView(),
      },
    );
  }
}
