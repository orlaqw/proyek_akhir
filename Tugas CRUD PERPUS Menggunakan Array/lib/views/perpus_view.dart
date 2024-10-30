import 'package:flutter/material.dart';
import 'package:tugas_navigasi_flutter/widgets/alertdialog.dart';
import '/controllers/perpus_controller.dart';
import '/models/perpus.dart';
import '/widgets/bottom_nav.dart';
import '/widgets/modal_widget.dart';

class PerpusView extends StatefulWidget {
  PerpusView({super.key});

  @override
  State<PerpusView> createState() => _PerpusViewState();
}

class _PerpusViewState extends State<PerpusView> {
  PerpusController perpust = PerpusController();
  TextEditingController judulInput = TextEditingController(); //controller untuk mengambil data dari form, TextEditingController() untuk input
  TextEditingController deskripsiInput = TextEditingController();
  TextEditingController penerbitInput = TextEditingController();
  TextEditingController karyaInput = TextEditingController();
  TextEditingController gambarInput = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController bintang = TextEditingController();
  final formKey = GlobalKey<FormState>(); //final formKey untuk validasi form, data username, password dll diapit oleh form, 
  ModalWidget modal = ModalWidget();
  alertDialog alert = alertDialog();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Perpus>? buku;
  int? buku_id;
  getBuku() {
    setState(() { //setstate untuk mereload data setiap membuka halamannya, menggunakan setState agar menyimpan data secara realtime
      buku = perpust.perpus; //film untuk menyimpan data dari movies dan movie
    });
  }

  addFilm(data) {
    buku!.add(data);
    getBuku();
  }

  @override
  void initState() { //initState untuk menjalankan skrip di awal membuka, untuk memanggil getFilm
    // TODO: implement initState
    super.initState();
    getBuku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buku", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  buku_id = null; //null agar dikosongi
                });
                judulInput.text = '';
                deskripsiInput.text = '';
                gambarInput.text = '';
                penerbitInput.text = '';
                karyaInput.text = '';
                stok.text = '';
                bintang.text = '';
                modal.showFullModal(context, fromTambah(null)); 
              },
              icon: Icon(Icons.add_sharp))
        ],

      ),

      body: buku != null
          ? ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: buku!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                    child: ListTile(
                  leading: Image(
                    image: NetworkImage(buku![index].posterPath),
                  ),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Text(buku![index].judul, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(buku![index].deskripsi, style: TextStyle(fontSize: 12)),
                      Row(
                        children: [
                          Text("Karya: " + buku![index].karya, style: TextStyle(fontSize: 12,),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Penerbit: " + buku![index].penerbit, style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Stok: " + buku![index].stok.toString(), style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Rating Buku: ", style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                          for (var i = 0; i < buku![index].bintang!; i++)
                            Icon(Icons.star, color: Colors.amber, size: 13),
                        ],
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30.0,
                    ),
                    // onSelected: choiceAction,
                    
                    itemBuilder: (BuildContext context) {
                      return listAct.map((String choice) {
                        
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                          onTap: () {
                            if (choice == "Ubah") { //agar jika keluar halaman tambah data, data yang sudah ada bisa diubah/ data tetap tersimpan
                              setState(() {
                                buku_id = buku![index].id;
                              });

                              judulInput.text = buku![index].judul;
                              deskripsiInput.text = buku![index].deskripsi;
                              penerbitInput.text = buku![index].penerbit;
                              karyaInput.text = buku![index].karya;
                              gambarInput.text = buku![index].posterPath;
                              bintang.text= buku![index].bintang.toString();
                              stok.text = buku![index].stok.toString();
                              modal.showFullModal(context, fromTambah(index));
                            } else if (choice == "Hapus") {
                              
                              alert.showAlertDialog(context, () {
                                perpust.perpus.removeWhere(
                                    (item) => item.id == buku![index].id);
                                getBuku();
                              });

                              // buku!.removeWhere(
                              //     (item) => item.id == buku![index].id);
                              // getBuku();
                            }
                          },
                        );
                      }).toList();
                    },
                    
                  ),
                  )
                );
              })
          : Text("Data Kosong"),
      bottomNavigationBar: BottomNav(3),
    );
  }

Widget fromTambah(index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Tambah Data"),
          TextFormField(
            controller: judulInput, //variabel untuk menyimpan dari yang diketik
            decoration: InputDecoration(label: Text("Judul Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi'; //jika kosong akan muncul pesan 'harus diisi'
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: deskripsiInput, //variabel untuk menyimpan dari yang diketik
            decoration: InputDecoration(label: Text("Deskripsi Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi'; //jika kosong akan muncul pesan 'harus diisi'
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: penerbitInput, //variabel untuk menyimpan dari yang diketik
            decoration: InputDecoration(label: Text("Penerbit Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi'; //jika kosong akan muncul pesan 'harus diisi'
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: karyaInput, //variabel untuk menyimpan dari yang diketik
            decoration: InputDecoration(label: Text("Buku Karya")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi'; //jika kosong akan muncul pesan 'harus diisi'
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: gambarInput,
            decoration: InputDecoration(label: Text("Masukan Gambar Cover")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: stok,
            decoration: InputDecoration(label: Text("Stok Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: bintang,
            decoration: InputDecoration(label: Text("Rating Buku")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 20,),

          ElevatedButton( 
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (index != null) { 
                    buku![index].id = buku_id!; //film index id diganti jadi buku_id,
                    buku![index].judul = judulInput.text;
                    buku![index].deskripsi = deskripsiInput.text;
                    buku![index].karya = karyaInput.text;
                    buku![index].penerbit = penerbitInput.text;
                    buku![index].posterPath = gambarInput.text;
                    buku![index].bintang = int.parse(bintang.text);
                    buku![index].stok = double.parse(stok.text); //parse untuk mengubah string ke double
                    getBuku(); // getfilm untuk data diupdate, dirubah dan tersimpan, mereload data
                  } else {
                    buku_id = buku!.length + 1; //film id int karena bisa ditambah, semua text adalah string
                    Perpus data = Perpus(
                      id: buku_id!,
                      judul: judulInput.text,
                      deskripsi: deskripsiInput.text,
                      penerbit: penerbitInput.text,
                      karya: karyaInput.text,
                      posterPath: gambarInput.text,
                      stok: double.parse(stok.text), //double.parse untuk mengubah string ke double agar menyesuaikaj tipe data di movie.dart
                      bintang: int.parse(stok.text), //double.parse untuk mengubah string ke double agar menyesuaikaj tipe data di movie.dart
                    );
                    addFilm(data); //data disimpan ke dalam parameter
                  }
                  Navigator.pop(context); //pop adalah menghilangkan jika push menampilkan
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Simpan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}