import '/models/perpus.dart';

class PerpusController{
  final List<Perpus> perpus = [ //harus mengikuti tipe data yang sudah di buat di Movie, jika sudah diisi Movie isinya harus sesuai Movie
  //List untuk menyimpan lebih dari satu data
  //tipe datanya movie (yang di dalam <>), tapi bisa, String, int, bool, dll

  Perpus(
    id: 1, 
    judul: "Buku Superman",
    deskripsi: "Buku adalah kumpulan kertas yang dijilid menjadi satu, biasanya berisi tulisan atau gambar", 
    posterPath: 'assets/superman.jpg',
    penerbit: "Gramedia",
    karya: "Marvel",
    stok: 4, 
    bintang: 5,
    ),
  ]; //kurung siku adalah array, bisa lebih dari satu data
}