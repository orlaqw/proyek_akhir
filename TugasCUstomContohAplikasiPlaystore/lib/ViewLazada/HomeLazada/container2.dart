import 'package:flutter/material.dart';

class Container2 extends StatefulWidget {
  
  

  const Container2({super.key});

  @override
  State<Container2> createState() => _Container2State();
}

class _Container2State extends State<Container2> {

  TextEditingController nama = TextEditingController();
  var nama_lengkap = ''; //fungsinya untuk menyimpan data dari nama //petik atas digunakan untuk kosong/ string, agar ada isinya
  get_nama(){
    setState(() { //untuk menyimpan/ merubah data secara realtime
      nama_lengkap = nama.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
    });
  }

  var _selectedIndex = 0;

  onTapBar(index) {
    setState(() {
      _selectedIndex = index; //merubah simpanan data secara realtime
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe7ByWQ3mhCn-HS7_Xc8RPyv182QDBqG3kki4i2zR5xdGd61Mh'), fit: BoxFit.cover),
                    ),
                 child: Column(
                   children: [
                     Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.lightBlue, width: 2)), //container untuk garis bawah
                            ),
                            child: Row(
                              children: [
                                
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(bottom: 10),  
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.lightBlue, width: 2),
                                  ),

                                  child: Row(
                                  children: [
                                    Icon(Icons.star_rounded, color: Colors.white,),
                                    SizedBox(width: 10), // menambah jarak antara icon dan text
                                    Text("9.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                                  ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                
                                Container(
                                  child: Text("100% Gratis Ongkir", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white,),)),

                              ],
                            ),
                          ),
                          
                          Container( //container untuk text 7, 8, 9
                            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(image: NetworkImage('https://www.katebackdrop.com/cdn/shop/products/J09321.jpg?v=1611141875&width=1200'), fit: BoxFit.cover),
                              color: Colors.lightBlue,
                            ),
                            child: Column(
                              children: [
                                Text("Voucher Bonus Klaim Disini", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround, //space around untuk memberi jarak pas antara widget
                                    children: [
                                      Text("Rp. 15.000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),),
                                      Container(
                                        padding: EdgeInsets.only(left: 40, right: 40),
                                        decoration: BoxDecoration(
                                          border: Border(right: BorderSide(color: Colors.lightBlue, width: 2), left: BorderSide(color: Colors.lightBlue, width: 2)),
                                          ),
                                        child: Text("10% OFF", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                        ),
                                      Container(
                                        child: Row(
                                          children: [

                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.lightBlue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              fixedSize: Size(65, 35), //untuk mengatur ukuran button
                                              padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                                              ),
                                              onPressed: () {
                                                get_nama(); //dipanggil di get_nama
                                              },
                                              child: Text('Ambil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                                            ),
                                            
                                          ],
                                        ),

                                        //tombol container
                                        // padding: EdgeInsets.all(5),
                                        // decoration: BoxDecoration(
                                        //   color: Colors.lightBlue,
                                        //   borderRadius: BorderRadius.all(Radius.circular(10)),
                                        //   ),
                                        // child: Text("Ambil Semua", style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),)
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),//tutup container untuk text 7, 8, 9
                     
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row( //row scroll
                                children: [
                                  Container( //container luar row scroll
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ), 
                              
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 100, height: 100,)),
                                          ),
                                                 
                                          Container(
                                            padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Text("Best Deals", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                  ), //tutup container untuk gambar di dalam row scroll
                                  SizedBox(width: 10,),
                              
                                  Container( //container luar row scroll
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 100, height: 100,)),
                                          ),
                                                 
                                          Container(
                                            padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Text("9.9 Mega Sale", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                  ), //setiap container di dalam row scroll
                                  SizedBox(width: 10,),
                                  
                                  Container( //container luar row scroll
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxVdJYOTJbLasBFp2l5BJrBf9cVE7vG1ryEA&s'), width: 100, height: 100,)),
                                          ),
                                                 
                                          Container(
                                            padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Text("Trending", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                  ), //setiap container di dalam row scroll
                                  SizedBox(width: 10,),

                                  Container( //container luar row scroll
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 100, height: 100,)),
                                          ),
                                                 
                                          Container(
                                            padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Text("Text", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                  ), //setiap container di dalam row scroll
                                  SizedBox(width: 10,),

                                  Container( //container luar row scroll
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 100, height: 100,)),
                                          ),
                                                 
                                          Container(
                                            padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Text("Text", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)),
                                        ],
                                      ),
                                    ),
                                  ), //setiap container di dalam row scroll
                                  SizedBox(width: 10,),

                                ],
                              ),
                            ), //tutup row scroll
                          ), //tutup container untuk gambar di dalam row scroll
                          
                   ],
                 ),
               );
  }
}