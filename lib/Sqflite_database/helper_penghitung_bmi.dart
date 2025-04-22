import 'package:projek_aplikasi_kesehatan/models/penghitung_bmi_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HelperPenghitungBmi {
  static final HelperPenghitungBmi instance = HelperPenghitungBmi._init();

  static Database? _database;

  HelperPenghitungBmi._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('bmi.db');
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
CREATE TABLE bmi (
  id $idType,
  result $textType,
  category $textType,
  icon $intType,
  color $intType
  )
''');
  }

  Future<PenghitungBmiModel> create(PenghitungBmiModel bmi) async {
    final db = await instance.database;

    final id = await db.insert('bmi', bmi.toMap());
    return bmi.copy(id: id);
  }

  Future<PenghitungBmiModel?> readBmi(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'bmi',
      columns: ['id', 'result', 'category', 'icon', 'color'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PenghitungBmiModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<PenghitungBmiModel>> readAllBmi() async {
    final db = await instance.database;

    final result = await db.query('bmi');

    return result.map((json) => PenghitungBmiModel.fromMap(json)).toList();
  }

  Future<PenghitungBmiModel?> readLatestBmi() async {
    final db = await instance.database;

    final maps = await db.query(
      'bmi',
      columns: ['id', 'result', 'category', 'icon', 'color'],
      orderBy: 'id DESC',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return PenghitungBmiModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> update(PenghitungBmiModel bmi) async {
    final db = await instance.database;

    return db.update(
      'bmi',
      bmi.toMap(),
      where: 'id = ?',
      whereArgs: [bmi.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'bmi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}