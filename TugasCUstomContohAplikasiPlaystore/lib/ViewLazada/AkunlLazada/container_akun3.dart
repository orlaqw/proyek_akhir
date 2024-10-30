import 'package:flutter/material.dart';

class ContainerAkun3 extends StatefulWidget {
  const ContainerAkun3({super.key});

  @override
  State<ContainerAkun3> createState() => _ContainerAkun3State();
}

class _ContainerAkun3State extends State<ContainerAkun3> {

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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.lightBlue, width: 5)),
      ),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container( //kontainer kiri
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                // image: DecorationImage(image: AssetImage('assets/biruputih.jpg'), fit: BoxFit.cover,),
              ),
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width* 40/100,
                      alignment: Alignment.topLeft,
                      child: Row(//row judul kiri
                        children: [
                      
                          Icon(Icons.paid_rounded, color: Colors.amber, size: 20,),
                          SizedBox(width: 5,),
                          Text('Koin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                      
                        ],
                      ),
                    ),

                    Row(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 70, height: 70,),
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                            
                                Text('80 koin untuk !', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                Text('pengguna', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                Text('baru! Senilai!', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                SizedBox(height: 10,),
                                ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // fixedSize: Size(75, 20), //untuk mengatur ukuran button
                                padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                              ),
                              onPressed: () {
                                get_nama(); //dipanggil di get_nama
                              },
                              child: Text('Kumpulkan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                            ),
                            
                              ],
                            ),
                          )

                      ],
                    ),

                  ],
                ),
              ),
              
              Container( //kontainer kanan
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                // image: DecorationImage(image: AssetImage('assets/biruputih.jpg'), fit: BoxFit.cover,),
              ),
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width* 40/100,
                      alignment: Alignment.topLeft,
                      child: Row(//row judul kiri
                        children: [
                      
                          Icon(Icons.wallet_giftcard_rounded, color: Colors.lightGreen, size: 20,),
                          SizedBox(width: 5,),
                          Text('Hadiah Gratis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                      
                        ],
                      ),
                    ),

                    Row(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 70, height: 70,),
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                            
                                Text('Menangkan ', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                Text('hadiah gratis ', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                Text('dan voucher!', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                // fixedSize: Size(75, 20), //untuk mengatur ukuran button
                                padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                              ),
                              onPressed: () {
                                get_nama(); //dipanggil di get_nama
                              },
                              child: Text('Mulai', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                            ),
                            
                              ],
                            ),
                          )

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'),width: 35, height: 35,),
                      ),
                      SizedBox(height: 5,),
                      Text('LuckyEgg',style: TextStyle(fontSize: 10),)

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'),width: 35, height: 35,),
                      ),
                      SizedBox(height: 5,),
                      Text('MergeBoss',style: TextStyle(fontSize: 10),)

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'),width: 35, height: 35,),
                      ),
                      SizedBox(height: 5,),
                      Text('GoGoMatch',style: TextStyle(fontSize: 10),)

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'),width: 35, height: 35,),
                      ),
                      SizedBox(height: 5,),
                      Text('StyeStar',style: TextStyle(fontSize: 10),)

                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}