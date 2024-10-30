import 'package:coba/ViewLazada/PesanLazada/container_pesan1.dart';
import 'package:coba/ViewLazada/PesanLazada/container_pesan2.dart';
import 'package:coba/WidgetLazada/bottom_nav_laz.dart';
import 'package:flutter/material.dart';

class PesanLaz extends StatelessWidget {
  const PesanLaz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/biruputih.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
          
              ContainerPesan1(),

              ContainerPesan2(),
            
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavLaz(2),
      );
  }
}