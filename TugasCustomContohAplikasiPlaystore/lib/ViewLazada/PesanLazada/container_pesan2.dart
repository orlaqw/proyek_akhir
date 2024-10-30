import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerPesan2 extends StatelessWidget {
  const ContainerPesan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                // Container(
                //   width: 50,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //     image: DecorationImage(image: AssetImage('assets/sky.jpg'), fit: BoxFit.cover),
                //   ),
                // ),

                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height* 15/100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 50, height: 50,)
                    ),
                ),
                SizedBox(width: 10,),

                  Column(
                    children: [
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                  
                          Container(
                            width: MediaQuery.of(context).size.width* 65/100,
                            child: Row(
                              children: [
                                Text("Promosi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                SizedBox(width: 5,),
                                Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                              ],
                            ),
                          ),
                  
                          Text("08:31 AM", style: TextStyle(color: Colors.grey, fontSize: 10),),
                  
                        ],
                      ),
                  
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width* 76/100,
                            // margin: EdgeInsets.only(left: 10),
                            height: 100,
                            // width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(image: NetworkImage('data:image/jpeg;base64,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'), fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                  
                    ],
                  ),

              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                  ),
                ),

                  Container(
                    width: MediaQuery.of(context).size.width* 78/100,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text("Tanya", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                                ],
                              ),
                            ),

                            Container(
                              child: Text("Kemarin", style: TextStyle(color: Colors.grey, fontSize: 10),),
                              ),

                          ],
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                         
                          // margin: EdgeInsets.only(left: 10),
                          child: Text("Tanya Para Pembeli", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                  ),
                ),

                  Container(
                    width: MediaQuery.of(context).size.width* 78/100,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text("Tanya 2", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                                ],
                              ),
                            ),

                            Container(
                              child: Text("12/08/2023", style: TextStyle(color: Colors.grey, fontSize: 10),),
                              ),

                          ],
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                         
                          // margin: EdgeInsets.only(left: 10),
                          child: Text("Tanya Para Pembeli", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                  ),
                ),

                  Container(
                    width: MediaQuery.of(context).size.width* 78/100,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text("Tanya 3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                  SizedBox(width: 5,),
                                  // Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                                ],
                              ),
                            ),

                            Container(
                              child: Text("12/06/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                              ),

                          ],
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                         
                          // margin: EdgeInsets.only(left: 10),
                          child: Text("Tanya Para Pembeli", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                  ),
                ),

                  Container(
                    width: MediaQuery.of(context).size.width* 78/100,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text("Tanya 4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                  SizedBox(width: 5,),
                                  // Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                                ],
                              ),
                            ),

                            Container(
                              child: Text("12/06/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                              ),

                          ],
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                         
                          // margin: EdgeInsets.only(left: 10),
                          child: Text("Tanya Para Pembeli", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                  ),
                ),

                  Container(
                    width: MediaQuery.of(context).size.width* 78/100,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text("Tanya 5", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                  SizedBox(width: 5,),
                                  // Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                                ],
                              ),
                            ),

                            Container(
                              child: Text("12/06/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                              ),

                          ],
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                         
                          // margin: EdgeInsets.only(left: 10),
                          child: Text("Tanya Para Pembeli", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1),),
            ),
            child: Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), fit: BoxFit.cover),
                  ),
                ),

                  Container(
                    width: MediaQuery.of(context).size.width* 78/100,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text("Tanya 6", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.verified, color: Colors.redAccent, size: 15,),
                                ],
                              ),
                            ),

                            Container(
                              child: Text("12/06/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                              ),

                          ],
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                         
                          // margin: EdgeInsets.only(left: 10),
                          child: Text("Tanya Para Pembeli", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}