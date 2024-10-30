import 'package:flutter/material.dart';

class Container3 extends StatelessWidget {
  const Container3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container( //container untuk judul dan angka/ waktu, gambar
                          
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [

                                Row( //judul dan angka/ waktu
                                  children: [
                                    Container( //container untuk judul
                                      margin: EdgeInsets.only(left: 10, bottom: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text("FLASH SALE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text("04", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                                          ),
                                          SizedBox(width: 5), //jarak antara container

                                          Container(
                                            
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text("40", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                                          ),
                                          SizedBox(width: 5),

                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text("55", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                                          ),
                                        ],
                                      ),
                                    ), //tutup container untuk judul
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [ //row children

                                    Container( //Container untuk gambar dan tulisan dalam container
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg'), width: 110, height: 110,)
                                            ),
                                          Container( //container untuk tulisan dan angka
                                            margin: EdgeInsets.only(top: 5),
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ), 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container( //container untuk tulisan
                                                  padding: EdgeInsets.only(left: 2),
                                                  child: Text("Rp. 25.000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                                  ),
                                                Container( //container untuk angka
                                                  padding: EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.lightBlue,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Text("-10%", style: TextStyle(color: Colors.white,),),
                                                ),

                                              ],
                                            ),
                                          ), //tutup container untuk tulisan dan angka
                                        ],

                                      ),
                                    ),
                                    SizedBox(width: 10), //jarak antara container

                                    Container( //Container untuk gambar dan tulisan dalam container
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHRRHfHQ9TBR3FfwPKEYJ9ZxcLBXqNUH-ejz8GnLiI3AMIyD-biO86pUcFlaqD1jTB_TY&usqp=CAU'), width: 110, height: 110,)
                                            ),
                                          Container( //container untuk tulisan dan angka
                                            margin: EdgeInsets.only(top: 5),
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ), 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container( //container untuk tulisan
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Text("Rp. 000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                                  ),
                                                Container( //container untuk angka
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.lightBlue,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Text("00%", style: TextStyle(color: Colors.white),),
                                                ),

                                              ],
                                            ),
                                          ), //tutup container untuk tulisan dan angka
                                        ],

                                      ),
                                    ),
                                    SizedBox(width: 10), //jarak antara container

                                    Container( //Container untuk gambar dan tulisan dalam container
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHRRHfHQ9TBR3FfwPKEYJ9ZxcLBXqNUH-ejz8GnLiI3AMIyD-biO86pUcFlaqD1jTB_TY&usqp=CAU'), width: 110, height: 110,)
                                            ),
                                          Container( //container untuk tulisan dan angka
                                            margin: EdgeInsets.only(top: 5),
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ), 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container( //container untuk tulisan
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Text("Rp. 000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                                  ),
                                                Container( //container untuk angka
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.lightBlue,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Text("00%", style: TextStyle(color: Colors.white),),
                                                ),

                                              ],
                                            ),
                                          ), //tutup container untuk tulisan dan angka
                                          
                                        ],

                                      ),
                                    ),
                                    // SizedBox(width: 5),


                                  ], //tutup row children
                                ),
                                
                                Container( //container untuk garis bawah
                                    margin: EdgeInsets.only(left: 5, right: 5, top: 15),
                                    decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 2))
                                  ),
                                ),

                              ],
                            ),
                          ), //tutup judul dan angka/ waktu, gambar

                          Container( //container untuk judul dan angka/ waktu, gambar 

                          
                            padding: EdgeInsets.only(right: 10, bottom: 10, left: 10),
                            child: Column(
                              children: [

                                Row( //judul dan angka/ waktu
                                  children: [
                                    Container( //container untuk judul
                                      margin: EdgeInsets.only(left: 10, bottom: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text("Mulai dari 1RB", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.purpleAccent,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text("Choice", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                                          ),
                                          SizedBox(width: 5), //jarak antara container

                                        ],
                                      ),
                                    ), //tutup container untuk judul
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [ //row children

                                    Container( //Container untuk gambar dan tulisan dalam container
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDMGheeUg2Ze_DzqNcamrV1aCW37jHSj2Vpw&s'), width: 110, height: 110,)
                                            ),
                                          Container( //container untuk tulisan dan angka
                                            margin: EdgeInsets.only(top: 5),
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ), 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container( //container untuk tulisan
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Text("Rp. 000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                                  ),
                                                Container( //container untuk angka
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.purpleAccent,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Text("00%", style: TextStyle(color: Colors.white),),
                                                ),

                                              ],
                                            ),
                                          ), //tutup container untuk tulisan dan angka
                                        ],

                                      ),
                                    ),
                                    SizedBox(width: 10,),

                                    Container( //Container untuk gambar dan tulisan dalam container
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHRRHfHQ9TBR3FfwPKEYJ9ZxcLBXqNUH-ejz8GnLiI3AMIyD-biO86pUcFlaqD1jTB_TY&usqp=CAU'), width: 110, height: 110,)
                                            ),
                                          Container( //container untuk tulisan dan angka
                                            margin: EdgeInsets.only(top: 5),
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ), 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container( //container untuk tulisan
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Text("Rp. 000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                                  ),
                                                Container( //container untuk angka
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.purpleAccent,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Text("00%", style: TextStyle(color: Colors.white),),
                                                ),

                                              ],
                                            ),
                                          ), //tutup container untuk tulisan dan angka
                                        ],

                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    Container( //Container untuk gambar dan tulisan dalam container, container untuk digunakan border dengan adanya gambar background
                                    width: 120,
                                    height: 155,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration( 
                                      borderRadius: BorderRadius.all(Radius.circular(10),),
                                      image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Xce840GsmhCHv9JAyl7KB5TgG68qpnh03Fa06_yBxE2EBOUUuRjFoc94urk9wWnYtCg&usqp=CAU '),fit: BoxFit.cover),

                                    ),
                                      child: Column(
                                        children: [
                                          Container( //container gambar
                                            margin: EdgeInsets.only(top: 2),
                                            height: 110,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHRRHfHQ9TBR3FfwPKEYJ9ZxcLBXqNUH-ejz8GnLiI3AMIyD-biO86pUcFlaqD1jTB_TY&usqp=CAU'),),
                                              borderRadius: BorderRadius.all(Radius.circular(10),)
                                            ),
                                            child: Column( //column untuk membuat container subsidi ada di atas
                                              children: [
                                                Row( //row untuk membuat container subsidi ada di samping
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(5),
                                                      height: 30,
                                                      width: 65,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(image: AssetImage("assets/purpleaccent.jpg"), fit: BoxFit.cover),
                                                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),),
                                                      ),
                                                      child: Container( //container untuk label subsidi
                                                        alignment: Alignment.center,
                                                        child: Text("Subsidi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                          Container( //container untuk tulisan dan angka
                                            margin: EdgeInsets.only(top: 5),
                                            width: 140,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                            ), 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container( //container untuk tulisan
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Text("Rp. 000", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),)
                                                  ),
                                                Container( //container untuk angka
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.purpleAccent,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Text("00%", style: TextStyle(color: Colors.white),),
                                                ),

                                              ],
                                            ),
                                          ), //tutup container untuk tulisan dan angka
                                        ],

                                      ),
                                    ),
                                    


                                  ], //tutup row children
                                ),

                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),

                                ),

                                Container( //container untuk garis bawah
                                    margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 2))
                                  ),
                                ),

                              ],
                            ),
                          ), //tutup judul dan angka/ waktu, gambar

      ],
    );
  }
}