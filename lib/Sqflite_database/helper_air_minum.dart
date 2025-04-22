import 'package:projek_aplikasi_kesehatan/models/minum_air_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HelperMinumAir {
  static final HelperMinumAir instance = HelperMinumAir._init();

  static Database? _database;

  HelperMinumAir._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('water_intake.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const intType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE water_intake (
  id $idType,
  jumlah $intType,
  waktu $textType
  )
''');
  }

  Future<MinumAirModel> create(MinumAirModel waterIntake) async {
    final db = await instance.database;

    final id = await db.insert('water_intake', waterIntake.toMap());
    return waterIntake.copy(id: id);
  }

  Future<MinumAirModel?> readWaterIntake(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'water_intake',
      columns: ['id', 'jumlah', 'waktu'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return MinumAirModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<MinumAirModel>> readAllWaterIntake() async {
    final db = await instance.database;

    final result = await db.query('water_intake');

    return result.map((json) => MinumAirModel.fromMap(json)).toList();
  }

  Future<int> update(MinumAirModel waterIntake) async {
    final db = await instance.database;

    return db.update(
      'water_intake',
      waterIntake.toMap(),
      where: 'id = ?',
      whereArgs: [waterIntake.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'water_intake',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}