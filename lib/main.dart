import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/views/Beranda/beranda.dart';
import 'package:latihan_ukl_paket1android/views/MinumAir/minum_air.dart';
import 'package:latihan_ukl_paket1android/views/Pengingat/pengingat.dart';
import 'package:latihan_ukl_paket1android/views/Login/login_healthyme.dart';
import 'package:latihan_ukl_paket1android/views/Profil/profil.dart';
import 'package:latihan_ukl_paket1android/views/Register/register_healthyme.dart';
import 'package:latihan_ukl_paket1android/views/splashScreen.dart';

void main() {  
runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget {//scaffold dan materialapp tidak boleh dobel/ didalamnya scaffold dan materialapp
  const MyApp({Key? key}) :super(key: key); 

// This widget is the root of your application.  
@override

Widget build(BuildContext context) {  
  return MaterialApp(
    initialRoute: '/splashScreen', //initial route adalah awal yg terbuka
      routes: { //routing untuk menentukan alamat halaman bisa disebut url
        '/splashScreen': (context) => SplashScreen(),
        '/login': (context) => LoginHealthyme(),
        '/register': (context) => RegisterHealthyme(),
        '/beranda': (context) => Beranda(),
        '/pengingat': (context) => Pengingat(),
        '/minumAir': (context) => MinumAir(),
        '/profil': (context) => Profil(),
      },
    title: "HealthyMe",
    home: SplashScreen(),
    );
  } 
}  