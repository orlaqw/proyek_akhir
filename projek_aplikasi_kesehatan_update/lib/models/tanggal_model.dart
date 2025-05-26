class Tanggal {
  DateTime _tanggal;

  Tanggal() : _tanggal = DateTime.now();

  DateTime get tanggal => _tanggal;

  void setTanggal(DateTime newTanggal) {
    _tanggal = newTanggal;
  }

  @override
  String toString() {
    return "${_tanggal.day}-${_tanggal.month}-${_tanggal.year}";
  }
}

void main() {
  Tanggal today = Tanggal();
  print("Tanggal hari ini: ${today.toString()}");

  // Set a new date
  today.setTanggal(DateTime(2023, 12, 25));
  print("Tanggal baru: ${today.toString()}");
}