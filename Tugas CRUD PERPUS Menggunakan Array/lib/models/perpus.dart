class Perpus{ //untuk menyimpan data
  int id;
  String judul; //tipe data
  String deskripsi; 
  String penerbit; 
  String karya; 
  double? stok; //tanda tanya memperbolehkan null, jika sudah ada tanda tanya tidak perlu required
  int? bintang; //tanda tanya memperbolehkan null, jika sudah ada tanda tanya tidak perlu required
  String posterPath;
  Perpus({ //constructor
    required this.id, 
    required this.judul, 
    required this.deskripsi, 
    required this.penerbit, 
    required this.karya, 
    this.stok, 
    this.bintang, 
    required this.posterPath,
    }); //constructor, jika memanggil Movie harus ada parameter. Jika ada yang memanggil Movie, yang memanggil harus menyertakan int, string, bool, string, voteAverage
  // required agar tidak boleh null
}