import 'package:flutter/material.dart';

class ContainerWallet4 extends StatelessWidget {
  const ContainerWallet4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.lightBlue, width: 7)),
      ),
      padding: EdgeInsets.only(bottom: 20, right: 15, left: 15),
      child: Column(
        children: [

          Container(//container pertama
            padding: EdgeInsets.all(10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            
                Text("Promosi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Text("Lihat Semua", style: TextStyle(color: Colors. deepPurpleAccent, fontSize: 14, fontWeight: FontWeight.bold),),
            
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [

                Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7bOSm4H63e4noIokcPr9RuX-6p3LMITNxJw&s'), fit: BoxFit.cover),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text("Text text text text", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("Berlaku Hingga 22/12/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 15,),

          Container(//container kedua
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [

                Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7bOSm4H63e4noIokcPr9RuX-6p3LMITNxJw&s'), fit: BoxFit.cover),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text("Text text text text", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("Berlaku Hingga 22/12/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 15,),

          Container(//container ketiga
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [

                Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7bOSm4H63e4noIokcPr9RuX-6p3LMITNxJw&s'), fit: BoxFit.cover),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text("Text text text text", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("Berlaku Hingga 22/12/2000", style: TextStyle(color: Colors.grey, fontSize: 10),),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),

          Text("- - - - - - - - - - - Batas akhir - - - - - - - - - - - ", style: TextStyle(color: Colors.grey, fontSize: 10),)

        ],
      ),
    );
  }
}