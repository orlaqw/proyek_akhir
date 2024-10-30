import 'package:flutter/material.dart';

class Container4 extends StatelessWidget {
  const Container4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( //container background
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://t4.ftcdn.net/jpg/01/57/27/45/240_F_157274575_9fZRaP6oIg2wdgiDzy5W8pbEIvm5WizW.jpg'), fit: BoxFit.cover),
                        color: Colors.white,
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
    
                            Column( //row pertama dua container
                              
                              children: [
    
                                Container( //container base
                                  height: 270,
                                  width: 175,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
    
                                      Container( //container gambar
                                      margin: EdgeInsets.only(bottom: 10),
                                        height: 175,
                                        width: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage('https://cdn.qukasoft.com/f/990724/cG96WmFtNG0vcUp3ZUdFOVU1NG5hQT09/p/dark-souls-3-deluxe-edition-16150830.webp'), fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(Radius.circular(10),),
                                        ),
                                        child: Column(
                                          children: [
                                            Row( //row container untuk label
                                              children: [
                                                Container(
                                                  width: 100,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                  ),
                                                  child: Text("100% Gratis ongkir", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                ),
                                                Container(
                                                  width: 60,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.monetization_on, color: Colors.white, size: 10,),
                                                      SizedBox(width: 5),
                                                      Text("Coins", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                    ],
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      
                                       Row(
                                          children: [
    
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.lightBlue,
                                              ),
                                              child: Text("9.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),),
                                            ),
                                            SizedBox(width: 5,),
                                            
                                            Text("Dark Souls 3"),
    
                                          ],
                                        ),
    
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          alignment: Alignment.topLeft, 
                                          child: Text("Harga Rp. 925.522,71", style: TextStyle(fontWeight: FontWeight.bold),))
    
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Container(// container base
                                  height: 295,
                                  width: 175,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
    
                                      Container( //container gambar
                                      margin: EdgeInsets.only(bottom: 10),
                                        height: 200,
                                        width: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThn-im2VbgxaalKYUSB9Uukwma01Nys_T0CniKvMFH3AWRRnoGJdZ2G3HJ1ReMsA7fAwk&usqp=CAU'), fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(Radius.circular(10),),
                                        ),
                                        child: Column(
                                          children: [
                                            Row( //row container untuk label
                                              children: [
                                                Container(
                                                  width: 100,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                  ),
                                                  child: Text("100% Gratis ongkir", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                ),
                                                Container(
                                                  width: 60,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.monetization_on, color: Colors.white, size: 10,),
                                                      SizedBox(width: 5),
                                                      Text("Coins", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                    ],
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      
                                       Row(
                                          children: [
    
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.lightBlue,
                                              ),
                                              child: Text("9.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),),
                                            ),
                                            SizedBox(width: 5,),
                                            
                                            Text("Kucing Turu"),
    
                                          ],
                                        ),
    
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          alignment: Alignment.topLeft, 
                                          child: Text("Harga Rp. 500", style: TextStyle(fontWeight: FontWeight.bold),))
    
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
    
                              ],
                            ), //tutup row dua container
                            SizedBox(width: 20,), // jarak antara column
    
                            Column( //row kedu untuk dua container
                              
                              children: [
    
                                Container( //container base
                                  height: 295,
                                  width: 175,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
    
                                      Container( //container gambar
                                      margin: EdgeInsets.only(bottom: 10),
                                        height: 200,
                                        width: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage('data:image/jpeg;base64,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'), fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(Radius.circular(10),),
                                        ),
                                        child: Column(
                                          children: [
                                            Row( //row container untuk label
                                              children: [
                                                Container(
                                                  width: 100,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                  ),
                                                  child: Text("100% Gratis ongkir", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                ),
                                                Container(
                                                  width: 60,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.monetization_on, color: Colors.white, size: 10,),
                                                      SizedBox(width: 5),
                                                      Text("Coins", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                    ],
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      
                                       Row(
                                          children: [
    
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.lightBlue,
                                              ),
                                              child: Text("9.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),),
                                            ),
                                            SizedBox(width: 5,),
                                            
                                            Text("Nama Barang"),
    
                                          ],
                                        ),
    
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          alignment: Alignment.topLeft, 
                                          child: Text("Harga Rp.000", style: TextStyle(fontWeight: FontWeight.bold),))
    
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Container(
                                  height: 270,
                                  width: 175,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    // image: DecorationImage(image: AssetImage("assets/biru.jpg"), fit: BoxFit.cover),
                                  ),
                                  child: Column(
                                    children: [
    
                                      Container( //container gambar
                                      margin: EdgeInsets.only(bottom: 10),
                                        height: 175,
                                        width: 175,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(Radius.circular(10),),
                                        ),
                                        child: Column(
                                          children: [
                                            Row( //row container untuk label
                                              children: [
                                                Container(
                                                  width: 100,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                  ),
                                                  child: Text("100% Gratis ongkir", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                ),
                                                Container(
                                                  width: 60,
                                                  padding: EdgeInsets.only(left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),),
                                                    color: Colors.amber,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.monetization_on, color: Colors.white, size: 10,),
                                                      SizedBox(width: 5),
                                                      Text("Coins", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                    ],
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      
                                       Row(
                                          children: [
    
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                color: Colors.lightBlue,
                                              ),
                                              child: Text("9.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),),
                                            ),
                                            SizedBox(width: 5,),
                                            
                                            Text("Nama Barang"),
    
                                          ],
                                        ),
    
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          alignment: Alignment.topLeft, 
                                          child: Text("Harga Rp.000", style: TextStyle(fontWeight: FontWeight.bold),))
    
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
    
                              ],
                            ), //tutup row dua container
    
    
                           
                            
                          ],
                        ),
                      );
  }
}