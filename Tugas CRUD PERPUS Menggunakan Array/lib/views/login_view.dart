import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Kembali")), //kembali ke halaman awal (home)
        ElevatedButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/profile'); //karena menggunakan routing jadi harus ada named //pushReplacement untuk menghapus histori dan jika back akan langsung ke home/ yg awal
        }, child: Text("Profile")),
        ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, '/transaksi', arguments: [{ //pushNamed untuk menambahkan histori dan jika back akan kembali ke halaman sebelumnya //arguments untuk mengirim data (menambah parameter)
            'id': 1,
            'nama_produk': 'Buku',
            'harga': 20000
          },
          {
            'id': 2,
            'nama_produk': 'Pensil',
            'harga': 5000,
          }]); // map ciri2nya menggunakan kurung kurawal. data yang lebih dari 1 data/ baris disebut list, list menggunakan kurung siku
        }, child: Text("Transaksi")),

      ],
    );
  }
}