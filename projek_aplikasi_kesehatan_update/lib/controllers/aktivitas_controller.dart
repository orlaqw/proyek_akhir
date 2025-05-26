// filepath: /c:/file orla/Sekolah/Ngoding/Project Flutter/ProjekAplikasiKesehatan/lib/controllers/aktivitas_controller.dart
import 'package:projek_aplikasi_kesehatan/models/aktivitas_model.dart';
import 'package:projek_aplikasi_kesehatan/Sqflite_database/helper_aktivitas.dart';

class AktivitasController {
  final dbHelper = HelperAktivitas.instance;

  Future<List<AktivitasModel>> getAllAktivitas() async {
    final data = await dbHelper.readAllAktivitas();
    return data;
  }
}