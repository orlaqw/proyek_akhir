// filepath: /c:/file orla/Sekolah/Ngoding/Project Flutter/ProjekAplikasiKesehatan/lib/main.dart
import 'package:flutter/material.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/water_provider.dart';
import 'package:provider/provider.dart';
import 'package:projek_aplikasi_kesehatan/views/Beranda/beranda_view.dart';
import 'package:projek_aplikasi_kesehatan/views/MinumAir/minum_air_view.dart';
import 'package:projek_aplikasi_kesehatan/views/Pengingat/pengingat.dart';
import 'package:projek_aplikasi_kesehatan/views/Login/login_healthyme.dart';
import 'package:projek_aplikasi_kesehatan/views/Profil/profil.dart';
import 'package:projek_aplikasi_kesehatan/views/Register/register_healthyme.dart';
import 'package:projek_aplikasi_kesehatan/views/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WaterProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/splashScreen',
        routes: {
          '/splashScreen': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/beranda': (context) => BerandaView(),
          '/pengingat': (context) => Pengingat(),
          '/minumAir': (context) => MinumAirView(),
          '/profil': (context) => Profil(),
        },
        title: "HealthyMe",
        home: SplashScreen(),
      ),
    );
  }
}