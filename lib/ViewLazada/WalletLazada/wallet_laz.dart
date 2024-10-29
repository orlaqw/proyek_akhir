import 'package:coba/ViewLazada/HomeLazada/container3.dart';
import 'package:coba/ViewLazada/HomeLazada/container4.dart';
import 'package:coba/ViewLazada/WalletLazada/container_wallet1.dart';
import 'package:coba/ViewLazada/WalletLazada/container_wallet2.dart';
import 'package:coba/ViewLazada/WalletLazada/container_wallet3.dart';
import 'package:coba/ViewLazada/WalletLazada/container_wallet4.dart';
import 'package:flutter/material.dart';

class WalletLaz extends StatelessWidget {
  const WalletLaz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container( //container untuk gambar background body wallet yang ada di appbar
            
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/biruputih.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            
              child: Column(
                children: [
            
                  ContainerWallet1(),
            
                  ContainerWallet2(),
            
                  ContainerWallet3(),
            
                  ContainerWallet4(),
            
                ],
              ),
            
            ),
          ],
        ),
      ),
    );
  }
}