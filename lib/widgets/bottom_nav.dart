import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav(this.page);
  int page;

  @override
  State<BottomNav> createState() => _BotNavState();
}

class _BotNavState extends State<BottomNav> {

  getPage(index){ //index untuk menyimpan nilai
    if (index == 0){ //diberi logika untuk perpindah halaman
      Navigator.pushReplacementNamed(context, '/beranda');
    }else if (index == 1){
      Navigator.pushReplacementNamed(context, '/pengingat');
    }else if (index == 2){
      Navigator.pushReplacementNamed(context, '/minumAir');
    }else if (index == 3){
      Navigator.pushReplacementNamed(context, '/profil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 86, 180, 114),
        unselectedItemColor: Colors.grey,
        currentIndex:widget.page, //index yang dipilih
        onTap: getPage,
        items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Reminder',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.local_drink_outlined),
            activeIcon: Icon(Icons.local_drink),
            label: 'Consumption Water',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
            ),
          
        ],
      );
  }
}