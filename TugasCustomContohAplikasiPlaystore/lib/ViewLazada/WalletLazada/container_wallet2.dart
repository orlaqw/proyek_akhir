import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWallet2 extends StatelessWidget {
  const ContainerWallet2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.lightBlue, width: 7)),
      ),

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [

      //     Column(

      //     ),

      //   ],
      // ),

      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [

              Column(//cloumn pertama
                children: [

                  Container(
                    child: Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.payments, color: Colors.lightBlue, size: 30,)),
                        Text("Transaksi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                        // Image(image: AssetImage('assets/ '))
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),

                  Container(
                child: Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.assignment, color: Colors.lightBlue, size: 30,)),
                    Text("Bayar Tagihan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                    // Image(image: AssetImage('assets/ '))
                  ],
                ),
              ),

                ],
              ),

              Column(//column kedua
                children: [

                  Container(
                    child: Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.payment, color: Colors.lightBlue, size: 30,)),
                        Text("Metode Bayar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),

                  Container(
                    child: Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.airplane_ticket, color: Colors.lightBlue, size: 40,)),
                        Text("Perjalanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                        
                      ],
                    ),
                  ),

                ],
              ),

              Column(//column ketiga
                children: [

                  Container(
                    child: Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.discount, color: Colors.lightBlue, size: 30,)),
                        Text("Voucher", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                        // Image(image: AssetImage('assets/ '))

                  Container(
                    child: SizedBox(height:70,),
                  ),

                      ],
                    ),
                  ),
                ],
              ),

              Column(//column keempat
                children: [
                  
                  Container(
                    child: Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.confirmation_num, color: Colors.lightBlue, size: 30,)),
                        Text("Kupon Belanja", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                        // Image(image: AssetImage('assets/ '))
                      ],
                    ),
                  ),

                  Container(
                    child: SizedBox(height:70,),
                  ),

                ],
              ),

              Column(
                children: [

                  Container(
                    child: Column(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.add_to_home_screen_rounded, color: Colors.lightBlue, size: 30,)),
                        Text("Pulsa & eStore", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                        // Image(image: AssetImage('assets/ '))
                      ],
                    ),
                  ),

                  Container(
                    child: SizedBox(height:70,),
                  ),

                ],
              ),

            ],

          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,

          //   children: [

          //     // SizedBox(width: 10,),
          //     Container(
          //       child: Column(
          //         children: [
          //           IconButton(onPressed: () {}, icon: Icon(Icons.assignment_outlined, color: Colors.lightBlue, size: 30,)),
          //           Text("Bayar Tagihan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
          //           // Image(image: AssetImage('assets/ '))
          //         ],
          //       ),
          //     ),
          //     // SizedBox(width: 20),

          //     Container(
          //       child: Column(
          //         children: [
          //           IconButton(onPressed: () {}, icon: Icon(Icons.airplane_ticket, color: Colors.lightBlue, size: 40,)),
          //           Text("Perjalanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
          //           // Image(image: AssetImage('assets/ '))
          //         ],
          //       ),
          //     ),

          //   ],

          // ),

        ],
      ),
    );
  }
}