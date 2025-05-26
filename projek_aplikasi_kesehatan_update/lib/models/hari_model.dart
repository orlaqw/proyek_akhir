import 'package:intl/intl.dart';

class HariModel {
  DateTime _tanggal;

  HariModel() : _tanggal = DateTime.now();

  DateTime get tanggal => _tanggal;

  void setTanggal(DateTime newTanggal) {
    _tanggal = newTanggal;
  }

  String getFormattedTanggal() {
    return DateFormat('d MMMM y').format(_tanggal);
  }

  @override
  String toString() {
    return getFormattedTanggal();
  }
}