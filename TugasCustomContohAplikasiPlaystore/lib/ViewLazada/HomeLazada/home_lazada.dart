import 'package:coba/ViewLazada/HomeLazada/container1.dart';
import 'package:coba/ViewLazada/HomeLazada/container2.dart';
import 'package:coba/ViewLazada/HomeLazada/container3.dart';
import 'package:coba/ViewLazada/HomeLazada/container4.dart';
import 'package:coba/ViewLazada/HomeLazada/appbar_laz.dart';
import 'package:coba/WidgetLazada/bottom_nav_laz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeLazada extends StatelessWidget {
  const HomeLazada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        
        // padding: EdgeInsets.all(20),
        
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Column(
              //   children: [
              //     Container(
              //       // padding: EdgeInsets.all(10),
              //       alignment: Alignment.topLeft, //untuk meratakan kiri
              //       child: Padding(
              //         padding: const EdgeInsets.all(10),
              //         child: Text("Judul", style: TextStyle(fontWeight: FontWeight.bold),),
              //       )
              //       ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween, //untuk meratakan ke kanan dan kiri
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: Text("Text 1"),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(10),
              //           child: Text("Text 2"),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

              

              Container1(),
              
              Container2(),

              Container3(),

              Container4(),

              

            ],
          ),

        ),

      ),

      bottomNavigationBar: BottomNavLaz(0),

    );
    
  }
}