import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/aktivitas_model.dart';

class HelperAktivitas {
  static final HelperAktivitas instance = HelperAktivitas._init();

  static Database? _database;

  HelperAktivitas._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('aktivitas.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE aktivitas (
  id $idType,
  judul $textType,
  deskripsi $textType,
  reminderTime $textType,
  icon $intType
  )
''');
  }

  Future<AktivitasModel> create(AktivitasModel aktivitas) async {
    final db = await instance.database;

    final id = await db.insert('aktivitas', aktivitas.toMap());
    return aktivitas.copy(id: id);
  }

  Future<AktivitasModel?> readAktivitas(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'aktivitas',
      columns: ['id', 'judul', 'deskripsi', 'reminderTime', 'icon'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return AktivitasModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<AktivitasModel>> readAllAktivitas() async {
    final db = await instance.database;

    final result = await db.query('aktivitas');

    return result.map((json) => AktivitasModel.fromMap(json)).toList();
  }

  Future<int> update(AktivitasModel aktivitas) async {
    final db = await instance.database;

    return db.update(
      'aktivitas',
      aktivitas.toMap(),
      where: 'id = ?',
      whereArgs: [aktivitas.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'aktivitas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}