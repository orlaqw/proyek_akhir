import 'package:coba/ViewLazada/PesanLazada/pesan_laz.dart';
import 'package:flutter/material.dart';

class AppBarPesan extends StatefulWidget {
  const AppBarPesan({super.key});

  @override
  State<AppBarPesan> createState() => _AppBarPesanState();
}

class _AppBarPesanState extends State<AppBarPesan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

          leading: SizedBox(width: 5,),
          centerTitle: false, //untuk mengatur tittle pada sisi kiri
          title: Text("Pesan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          flexibleSpace: Image(image: NetworkImage('https://t4.ftcdn.net/jpg/01/57/27/45/240_F_157274575_9fZRaP6oIg2wdgiDzy5W8pbEIvm5WizW.jpg'), fit: BoxFit.cover),
          // backgroundColor: Colors.white,

          actions: [

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.cleaning_services_outlined,
                color: Colors.black,
              ),
            ),
            // Padding(padding: EdgeInsets.only(right: 20),),
            SizedBox(width: 20,),
          ],

        ),

        body: PesanLaz(),

    );
  }
}