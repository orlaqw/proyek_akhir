import 'package:flutter/material.dart';

class ContainerAkun1 extends StatelessWidget {
  const ContainerAkun1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.lightBlue, width: 5,),),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [

          Row(//row akun
            children: [
          
              ClipOval(
                child: Image(image: NetworkImage('https://st4.depositphotos.com/1000943/19797/i/450/depositphotos_197975346-stock-photo-blue-sky-white-clouds-may.jpg'), width: 50, height: 50,),
                ),
          
              Container(
                child: Column(
                  children: [
          
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width* 77/100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      
                          Text('Username', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined),),
                      
                        ],
                      ),
                    ),
          
                    Container(
                      // width: MediaQuery.of(context).size.width* 75/100,
                      child: Row(
                        children: [
                      
                          Text('15', style: TextStyle(fontSize: 12),),
                          SizedBox(width: 5,),
                          Text('WishListSaya', style: TextStyle(fontSize: 12, color: Colors.grey),),
                          
                          SizedBox(width: 5,),
          
                          Text('0', style: TextStyle(fontSize: 12),),
                          SizedBox(width: 5,),
                          Text('Toko yang saya ikuti', style: TextStyle(fontSize: 12, color: Colors.grey),),
                      
                          SizedBox(width: 5,),
          
                          Text('17', style: TextStyle(fontSize: 12),),
                          SizedBox(width: 5,),
                          Text('Voucher', style: TextStyle(fontSize: 12, color: Colors.grey),),
          
                        ],
                      ),
                    ),
          
                  ],
                ),
              ),
          
            ],
          ),
          SizedBox(height: 20,),

          Row( //row text
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Pesanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

              Row(
                children: [

                  Text('Lihat Semua Pesanan', style: TextStyle(fontSize: 13, color: Colors.grey),),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right_rounded, color: Colors.grey, size: 20,),),

                ],
              ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                child: Column(
                  children: [

                    IconButton(onPressed: () {}, icon: Icon(Icons.account_balance_wallet_rounded, size: 30, color: Colors.lightBlue),),
                    Text('Pilih', style: TextStyle(fontSize: 12,),),
                    Text('Pembayaran', style: TextStyle(fontSize: 12,),),

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    IconButton(onPressed: () {}, icon: Icon(Icons.inventory_2_rounded, size: 30, color: Colors.lightBlue),),
                    Text('Dalam', style: TextStyle(fontSize: 12,),),
                    Text('Proses', style: TextStyle(fontSize: 12,),),

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    IconButton(onPressed: () {}, icon: Icon(Icons.local_shipping_rounded, size: 30, color: Colors.lightBlue),),
                    Text('Dalam', style: TextStyle(fontSize: 12,),),
                    Text('Pengiriman', style: TextStyle(fontSize: 12,),),

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    IconButton(onPressed: () {}, icon: Icon(Icons.feedback_rounded, size: 30, color: Colors.lightBlue),),
                    Text('Untuk', style: TextStyle(fontSize: 12,),),
                    Text('Diulas', style: TextStyle(fontSize: 12,),),

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [

                    IconButton(onPressed: () {}, icon: Icon(Icons.wrap_text_rounded, size: 30, color: Colors.lightBlue),),
                    Text('Retur &', style: TextStyle(fontSize: 12,),),
                    Text('Pembatalan', style: TextStyle(fontSize: 12,),),

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