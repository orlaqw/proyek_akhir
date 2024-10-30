import 'package:flutter/material.dart';

class BottomNavLaz extends StatefulWidget {
  BottomNavLaz(this.page);
  int page;

  @override
  State<BottomNavLaz> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavLaz> {

  getPage(index){ //index untuk menyimpan nilai
    if (index == 0){ //diberi logika untuk perpindah halaman
      Navigator.pushReplacementNamed(context, '/home');
    }else if (index == 2){
      Navigator.pushReplacementNamed(context, '/pesan');
    }else if (index == 4){
      Navigator.pushReplacementNamed(context, '/akun');
    }
  }

  // TextEditingController nama = TextEditingController();
  // var nama_lengkap = ''; //fungsinya untuk menyimpan data dari nama //petik atas digunakan untuk kosong/ string, agar ada isinya
  // get_nama(){
  //   setState(() { //untuk menyimpan/ merubah data secara realtime
  //     nama_lengkap = nama.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
  //   });
  // }

  // var _selectedIndex = 0;

  // onTapBar(index) {
  //   setState(() {
  //     _selectedIndex = index; //merubah simpanan data secara realtime
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.blueGrey,
        currentIndex:widget.page, //index yang dipilih
        onTap: getPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Troli',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Akun',
          ),
        ],
      );

  }
}