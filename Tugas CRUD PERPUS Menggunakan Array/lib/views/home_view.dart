import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart'; //jika di folder lain mengimport tanpa package menggunakan titik titik lalu garing nama folder

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: () {
        Navigator.pushNamed(context,'/login'); //push artinya didorong artinya loginnya didepan, homenya terbuka dibelakang login, jika di back akan kembali ke sebelumnya
      }, 
      child: Text("Login"),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}