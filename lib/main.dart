// ignore_for_file: prefer_const_constructors  ]

import 'package:coba/ViewLazada/HomeLazada/appbar_laz.dart';
import 'package:coba/ViewLazada/HomeLazada/home_lazada.dart';
import 'package:coba/ViewLazada/PesanLazada/appbar_pesan.dart';
import 'package:coba/ViewLazada/PesanLazada/pesan_laz.dart';
import 'package:coba/ViewLazada/AkunlLazada/akun_lazada.dart';
import 'package:coba/ViewLazada/WalletLazada/appbar_wallet.dart';
import 'package:coba/ViewLazada/WalletLazada/wallet_laz.dart';
import 'package:coba/coba.dart';
import 'package:flutter/material.dart'; //memanggil file material.dart


void main() {  
runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget {//scaffold dan materialapp tidak boleh dobel/ didalamnya scaffold dan materialapp
  const MyApp({Key? key}) :super(key: key); 

// This widget is the root of your application.  
@override

Widget build(BuildContext context) {  
  return MaterialApp(
    initialRoute: '/', //initial route adalah awal yg terbuka
      routes: { //routing untuk menentukan alamat halaman bisa disebut url
        '/home': (context) => AppBarLaz(),
        '/wallet': (context) => AppBarWallet(),
        '/pesan': (context) => AppBarPesan(),
        '/akun': (context) => AkunLazada(),
      },
    title: "Referensi Lazada",
    home: AppBarLaz(),
    );
  } 
}  
