import 'package:flutter/material.dart';

class ContainerAkun2 extends StatelessWidget {
  const ContainerAkun2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Container(
            height: 125,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQrL_hY9Z13ja1yVAhgkAzgAHxIU3kUKL1RA&s'),fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row( //row text
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            
                Text('Game dan Koin', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            
                Row(
                  children: [
            
                    Text('Selesaikan Misi', style: TextStyle(fontSize: 13, color: Colors.grey),),
                    IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right_rounded, color: Colors.grey, size: 20,),),
            
                  ],
                ),
            
              ],
            ),
          ),

        ],
      ),
    );
  }
}