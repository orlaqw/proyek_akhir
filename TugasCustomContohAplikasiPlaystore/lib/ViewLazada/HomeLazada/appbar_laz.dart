import 'package:coba/ViewLazada/HomeLazada/home_lazada.dart';

import '../../WidgetLazada/input_widget.dart';
// import '../HomeLazada/home_lazada.dart';
import 'package:flutter/material.dart';

class AppBarLaz extends StatefulWidget {
  const AppBarLaz({super.key});

  @override
  State<AppBarLaz> createState() => _appBarState();
}

class _appBarState extends State<AppBarLaz> {

  TextEditingController nama = TextEditingController();
  var nama_lengkap = ''; //fungsinya untuk menyimpan data dari nama //petik atas digunakan untuk kosong/ string, agar ada isinya
  get_nama(){
    setState(() { //untuk menyimpan/ merubah data secara realtime
      nama_lengkap = nama.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
    });
  }

  var _selectedIndex = 0;

  onTapBar(index) {
    setState(() {
      _selectedIndex = index; //merubah simpanan data secara realtime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InputWidget(),
        leading: //menambah icon di kiri appbar
        IconButton(onPressed: () {}, 
          icon: Icon(
            Icons.document_scanner_outlined,
            
          ),
        ),
      
        backgroundColor: Colors.lightBlue, //warna appbar
        foregroundColor: Colors.white, //warna icon
        actions: [ //action untuk membuat icon di kanan appbar
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size(65, 35), //untuk mengatur ukuran button
            padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
            ),
            onPressed: () {
              get_nama(); //dipanggil di get_nama
            },
            child: Text('Cari', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 15),),
          ),
          SizedBox(width: 5,),
          IconButton(onPressed: () {}, 
          icon: Icon(Icons.camera_alt_outlined)
          ),
          SizedBox(width: 5,),
          IconButton(onPressed: () {
            Navigator.pushNamed(context,'/wallet');
          }, 
          icon: Icon(Icons.account_balance_wallet_outlined)
          ),
          SizedBox(width: 10,),
        ],
        ),
      body: HomeLazada(),
    );

      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.lightBlue,
      //   unselectedItemColor: Colors.blueGrey,
      //   currentIndex: _selectedIndex,
      //   onTap: onTapBar,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Like',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message_rounded),
      //       label: 'Pesan',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart_checkout),
      //       label: 'Troli',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Akun',
      //     ),
      //   ],
      // ),
      
  }
}