import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projek_aplikasi_kesehatan/models/minum_air_model.dart';

class HistoriMinumAir extends StatelessWidget {
  final List<MinumAirModel> historiHariIni;
  final List<MinumAirModel> historiLewat;
  final Function(int) confirmRemoveHistory;

  HistoriMinumAir({
    required this.historiHariIni,
    required this.historiLewat,
    required this.confirmRemoveHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 1.2,
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  "Water Consumption History",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Today",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          historiHariIni.isEmpty
              ? Text("History Empty", style: TextStyle(fontSize: 16, color: Colors.grey))
              : Column(
                  children: historiHariIni.map((entry) {
                    int jumlah = entry.jumlah;
                    DateTime waktu = entry.waktu;
                    String formattedDate = DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(waktu);
                    return Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text('$jumlah ml'),
                          subtitle: Text(formattedDate),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => confirmRemoveHistory(entry.id!),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
          SizedBox(height: 10),
          Text(
            "Before",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          historiLewat.isEmpty
              ? Text("History Empty", style: TextStyle(fontSize: 16, color: Colors.grey))
              : Column(
                  children: historiLewat.map((entry) {
                    int jumlah = entry.jumlah;
                    DateTime waktu = entry.waktu;
                    String formattedDate = DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(waktu);
                    return Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text('$jumlah ml'),
                          subtitle: Text(formattedDate),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => confirmRemoveHistory(entry.id!),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}