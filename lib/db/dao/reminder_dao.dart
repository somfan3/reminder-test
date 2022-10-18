import 'package:test_1/db/entities/reminder.dart';
import 'package:test_1/db/plant_db.dart';

class ReminderDao {
  static const String TABLE_NAME = "Reminder";
  static const String SQL_REMINDER = "CREATE TABLE $TABLE_NAME("
      "id INTEGER PRIMARY KEY,"
      " type TEXT,"
      " time Text,"
      " frequency TEXT);";

  static Future<bool> insertReminder(Reminder reminder) async {
    final db = await PlantDB.instance.database;

    final result = await db?.insert(TABLE_NAME, reminder.toJson());
    return result != -1;
  }

  static Future<List<Reminder>> getAllReminder() async {
    final db = await PlantDB.instance.database;
    List<Reminder> reminders = [];

    final query = await db?.query(TABLE_NAME);
    if (query != null) {
      reminders =
          List<Reminder>.from(query.map((e) => Reminder.fromJson(e))).toList();
    }

    return reminders;
  }

  static Future<bool> updateItem(
      {required int id, required Reminder reminder}) async {
    final db = await PlantDB.instance.database;

    final result = await db?.update(TABLE_NAME, reminder.toJson(),
        where: "id = ?", whereArgs: [id]);

    return result != -1;
  }
}
