import 'package:coba/ViewLazada/AkunlLazada/container_akun1.dart';
import 'package:coba/ViewLazada/AkunlLazada/container_akun2.dart';
import 'package:coba/ViewLazada/AkunlLazada/container_akun3.dart';
import 'package:coba/WidgetLazada/bottom_nav_laz.dart';
import 'package:flutter/material.dart';

class AkunLazada extends StatelessWidget {
  const AkunLazada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
          
              ContainerAkun1(),
          
              ContainerAkun2(),
          
              ContainerAkun3(),
          
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavLaz(4),

    );
  }
}