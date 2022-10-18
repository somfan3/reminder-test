import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/reminder_dao.dart';

class PlantDB {
  static final PlantDB _db = PlantDB._internal();

  PlantDB._internal();

  static PlantDB get instance => _db;
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _init();
    return _database;
  }

  Future<Database> _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'plant_db.db'),
      onCreate: (db, version) {
        db.execute(ReminderDao.SQL_REMINDER);
      },
      version: 1,
    );
  }
}
