import 'package:flutter/material.dart';

class ContainerPesan1 extends StatelessWidget {
  const ContainerPesan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://t4.ftcdn.net/jpg/01/57/27/45/240_F_157274575_9fZRaP6oIg2wdgiDzy5W8pbEIvm5WizW.jpg'), fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          
          Column(
            children: [
          
              Container( //container atas
                
                height: 75,
                width: 185,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(//column Text
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Pesanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text("Setelah melakukan pesanan", style: TextStyle(color: Colors.grey, fontSize: 12),)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Container( //container bawah
                
                height: 75,
                width: 185,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(//column Text
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Aktivitas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text("Text deskripsi", style: TextStyle(color: Colors.grey, fontSize: 12),)),
                      ],
                    ),
                  ],
                ),
              ),
          
            ],
          ),
          
          Column( //column kedua
            children: [
          
              Container( //container atas
                
                height: 75,
                width: 185,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(//column Text
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Chats", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Ingin mengirimkan pesan", style: TextStyle(color: Colors.grey, fontSize: 12),),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Container( //container bawah
                
                height: 75,
                width: 185,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://png.pngtree.com/background/20210709/original/pngtree-blue-sky-white-clouds-splashes-of-watercolor-background-picture-image_911603.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(//column Text
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Promo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Money can't buy happiness", style: TextStyle(color: Colors.grey, fontSize: 12),),
                      ],
                    ),
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