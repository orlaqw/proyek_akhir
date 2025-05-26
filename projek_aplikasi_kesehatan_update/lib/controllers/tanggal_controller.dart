import '../models/tanggal_model.dart';

class TanggalController {
  final Tanggal _tanggalModel = Tanggal();

  DateTime get tanggal => _tanggalModel.tanggal;

  void setTanggal(DateTime newTanggal) {
    _tanggalModel.setTanggal(newTanggal);
  }

  @override
  String toString() {
    return _tanggalModel.toString();
  }
}