import 'package:coba/ViewLazada/WalletLazada/wallet_laz.dart';
import 'package:flutter/material.dart';

class AppBarWallet extends StatelessWidget {
  const AppBarWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context,'/home');
        }, 
        icon: Icon(Icons.arrow_back_ios_new_rounded),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
            ),
          ),
          SizedBox(width: 20,),
        ],

        title: Text('Pembayaran'),
      ),

      body: WalletLaz(),

    );
  }
}