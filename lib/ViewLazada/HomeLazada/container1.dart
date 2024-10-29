import 'package:flutter/material.dart';

class Container1 extends StatelessWidget {
  const Container1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( //container berbackground
                // padding: EdgeInsets.all(20),
                // margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage("assets/biruputih.jpg"), fit: BoxFit.cover),
                  // color: Colors.white,
                  
                ),

                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(bottom: 10,right: 10, left: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blueGrey, width: 2)) //container untuk garis bawah
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 150,
                              width: 355,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage('https://pbs.twimg.com/media/FAb4Iv_UUAIJUqx.jpg:large'), fit: BoxFit.cover),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              height: 150,
                              width: 355,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu_ZbAsb3mGcxR3WBFCIec-SwmvgH-z6tuyTyGn2SKwvbSYV1ygOFfQgEOFaWSsQlPEPo&usqp=CAU'), fit: BoxFit.cover),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              height: 150,
                              width: 355,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyjPIdJMvSf7n4jke7DWHcHa4A1_XGB_8vFTxkhC4dZVEhXBofoNKjxZuDpvTOzRaLINc&usqp=CAU'), fit: BoxFit.cover),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                   Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                     child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                       child: Row(
                        children: [
                     
                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://pbs.twimg.com/media/EUbePLEU0AIpder.jpg'), width: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Ovo")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                     
                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://crm.thetempogroup.com/api/v1/media/product_image/image/6'), width: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Gopay")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                     
                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJt0JlV1I5ksK9m3op3J7TySXptRMlFRpWGqEmNKpfTbKeqtovoUuRUbZjqHlN2Jc28J0&usqp=CAU'), width: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Dana")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),

                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF8oAaV74uqw4x4nwemKsuinvizCydhfaBiA&s'), width: 50, height: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("BNI")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),

                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://cdn.iconscout.com/icon/free/png-256/free-bca-logo-icon-download-in-svg-png-gif-file-formats--bank-central-asia-pack-logos-icons-225544.png?f=webp'), width: 50, height: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("BCA")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),

                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Text")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Text")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 50,)),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Text")
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                     
                     
                     
                        ],
                       ),
                     ),
                   ),

                  ],
                ),

              );
  }
}