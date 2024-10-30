import 'package:flutter/material.dart';

class ContainerWallet3 extends StatefulWidget {
  const ContainerWallet3({super.key});

  @override
  State<ContainerWallet3> createState() => _ContainerWallet3State();
}

class _ContainerWallet3State extends State<ContainerWallet3> {
TextEditingController nama = TextEditingController();

  var nama_lengkap = ''; 
 //fungsinya untuk menyimpan data dari nama //petik atas digunakan untuk kosong/ string, agar ada isinya
  get_nama(){
    setState(() { //untuk menyimpan/ merubah data secara realtime
      nama_lengkap = nama.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
    });
  }

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.lightBlue, width: 7)),
      ),
      padding: EdgeInsets.only(bottom: 20, right: 15, left: 15),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.all(10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            
                Text("Produk Digital", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Text("Produk Digital Lainnya", style: TextStyle(color: Colors. deepPurpleAccent, fontSize: 14, fontWeight: FontWeight.bold),),
            
              ],
            ),
          ),

          Container(

            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            child: Column(
              children: [
                
                Row(
                  children: [

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTA4L3Jhd3BpeGVsX29mZmljZV8zM19waW5rX3BhcGVyX3RleHR1cmVfY2FyZGJvYXJkX2JhY2tncm91bmRfbWluaV84MjQwMjJlOC1kNGVkLTQxOTMtYmExNy01ODVmZDU4ZmQ5YTNfMS5qcGc.jpg'), fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topLeft: Radius.circular(10)),
                      ),
                      child: Text("Pulsa", style: TextStyle(color: Colors.redAccent, fontSize: 15),),
                    ),

                  ],
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("0813000000", style: TextStyle(fontWeight: FontWeight.bold),)
                        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Rp5.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fixedSize: Size(100, 35), //untuk mengatur ukuran button
                              padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                            ),
                            onPressed: () {
                              get_nama(); //dipanggil di get_nama
                            },
                            child: Text('Beli Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                          ),

                        ],
                      ),
                      
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Harga Rp5.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.redAccent),)
                        ),

                    ],
                  ),
                  
                  )

              ],
            ),
          ),

        ],
      ),
    );
  }
}