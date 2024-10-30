import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class TransaksiView extends StatelessWidget {
  const TransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as List; //jika text biasa/ 1 angka, arg akan menyimpan data halaman sebelumnya (menangkap data string biasa), jika ada kurung siku berarti list bi
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/'); //karena menggunakan routing jadi harus ada named //pushReplacement untuk menghapus histori dan jika back akan langsung ke home/ yg awal
        },
        child: Text('Home/ back'),
      ),
          Text("Halaman Transaksi"),
          Text("ID "+arg[0]["id"].toString()), //.ToString untuk menjadikan int menjadi String. kotak/ array pertama baris, keldua kolom
          Text("Nama Produk: ${arg[0]["nama_produk"]}"), //dollar kurung kurawal untuk menampilkan data, kotaknya 1 jika satu data
          Text("Nama Produk: ${arg[0]["harga"]}"), //petik satu ('') jika yang diluar sudah petik 2("")dollar kurung kurawal untuk menampilkan data, kotaknya 1 jika satu data
        ],
      ),
      bottomNavigationBar: BottomNav(2),
    );
  }
}