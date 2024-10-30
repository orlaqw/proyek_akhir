import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/'); //karena menggunakan routing jadi harus ada named //pushReplacement untuk menghapus histori dan jika back akan langsung ke home/ yg awal
        },
        child: Text('Home/ back'),
      ),
          bottomNavigationBar: BottomNav(1),
    );
  }
}