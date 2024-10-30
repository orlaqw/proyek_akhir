import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController nama = TextEditingController();
  var nama_lengkap = ''; //fungsinya untuk menyimpan data dari nama //petik atas digunakan untuk kosong/ string, agar ada isinya
  get_nama(){
    setState(() { //untuk menyimpan/ merubah data secara realtime
      nama_lengkap = nama.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(//memberi background, warna, margin, padding

      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white //warna background
            ),
            child: TextField(
              controller: nama,
              obscureText: false,
              decoration: InputDecoration( //untuk memberi dekorasi/ menghias textfield
                border: OutlineInputBorder(),
                label: Text('Cari Barang', style: TextStyle(color: Colors.blueGrey),), //untuk memberi tulisan didalam textfield
                
              ),
            ),
          ),
      
                // Text(nama_lengkap), //untuk menampilkan dari data yang disimpan di nama_lengkap
                
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         image: DecorationImage(
                //           image: AssetImage('assets/biru.jpg'),
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       child: ElevatedButton(
                //         onPressed: () {
                //           get_nama(); //dipanggil di get_nama
                //           },
                //           child: Text('Cari'),
                //       ),
                //     ),
          
        ],
      ),
    );

  }
}