import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav(this.page);
  int page;

  @override
  State<BottomNav> createState() => _ButtomNavState();
}

class _ButtomNavState extends State<BottomNav> {
  getPage(index){ //index untuk menyimpan nilai
    if (index == 0){ //diberi logika untuk perpindah halaman
      Navigator.pushReplacementNamed(context, '/');
    }else if (index == 1){
      Navigator.pushReplacementNamed(context, '/profile');
    }else if (index == 2){
      Navigator.pushReplacementNamed(context, '/transaksi', arguments: [
        {
          "id": 1,
          "nama_produk": "Laptop",
          "harga": 10000000
        }
      ]);
    }
    else if (index == 3){
      Navigator.pushReplacementNamed(context,'/perpus');
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    selectedItemColor: Colors.black, //warna item yang dipilih
    unselectedItemColor: Colors.grey, //warna item yang tidak dipilih
    currentIndex:widget.page, //index yang dipilih
    onTap: getPage, //menentukan index yang dipilih/ mau kemana/ untuk mengeklilk item

    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),
      label: "Home"
      ),
      BottomNavigationBarItem(icon: Icon(Icons.person),
      label: "Profile"
      ),
      BottomNavigationBarItem(icon: Icon(Icons.payment),
      label: "Trans"
      ),
      BottomNavigationBarItem(icon: Icon(Icons.book),
      label: "Perpus"
      ),

    ],);
  }
}