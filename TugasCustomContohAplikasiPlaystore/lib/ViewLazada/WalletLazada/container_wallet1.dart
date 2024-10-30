import 'package:flutter/material.dart';

class ContainerWallet1 extends StatefulWidget {


  const ContainerWallet1({super.key});

  @override
  State<ContainerWallet1> createState() => _ContainerWallet1State();
}

class _ContainerWallet1State extends State<ContainerWallet1> {
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
      child: Column(
        children: [

          Container( //container pertama dana

            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.only(right: 10), //unutk memberi jarak pada tombol dengan container luarnya

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage('https://t4.ftcdn.net/jpg/01/57/27/45/240_F_157274575_9fZRaP6oIg2wdgiDzy5W8pbEIvm5WizW.jpg'), fit: BoxFit.cover),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(image:  NetworkImage('https://static.vecteezy.com/system/resources/previews/028/766/365/original/dana-payment-icon-symbol-free-png.png'), width: 50, height: 50,)),
                        SizedBox(width: 10,),

                      Container(
                        // padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("Dana Balance (Rp)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                            Row(
                              children: [

                                Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Icon(Icons.keyboard_arrow_right_outlined,),

                              ],
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(65, 35), //untuk mengatur ukuran button
                    padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                  ),
                  onPressed: () {
                    get_nama(); //dipanggil di get_nama
                  },
                  child: Text('Isi Saldo', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 12),),
                ),

                // Container(
                //   margin: EdgeInsets.only(right: 10),
                //   padding: EdgeInsets.all(5),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: Colors.white,
                //   ),

                //   child: Text("Isi Saldo", style: TextStyle(color: Colors.lightBlue),),
                // ),

              ],
            ),


          ),
          SizedBox(height: 10,),

          Container( //container kedua BNI

            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.only(right: 10), //unutk memberi jarak pada tombol dengan container luarnya

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage('https://t4.ftcdn.net/jpg/01/57/27/45/240_F_157274575_9fZRaP6oIg2wdgiDzy5W8pbEIvm5WizW.jpg'), fit: BoxFit.cover),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(image:  NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCFmoeqWnN6GOvDKA0SkLBEaM0IPxdMj91aDDg95622DTtL-cfhSO1nt6gzmt8LGvPDl4&usqp=CAU'), width: 50, height: 50,)),
                        SizedBox(width: 10,),

                      Container(
                        // padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("BNI Balance (Rp)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                            Row(
                              children: [

                                Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Icon(Icons.keyboard_arrow_right_outlined,),

                              ],
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     fixedSize: Size(65, 35), //untuk mengatur ukuran button
                //     padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                //     tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                //   ),
                //   onPressed: () {
                //     get_nama(); //dipanggil di get_nama
                //   },
                //   child: Text('Isi Saldo', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 12),),
                // ),

              ],
            ),

          ),

        ],
      ),
    );
  }
}