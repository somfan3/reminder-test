import 'package:get/get.dart';
import 'package:test_1/db/dao/reminder_dao.dart';
import 'package:test_1/db/entities/reminder.dart';

class TestController extends GetxController {
  RxList<Reminder> reminders = <Reminder>[].obs;

  @override
  void onInit() {
    getReminders();
    super.onInit();
  }

  Future<void> getReminders() async {
    reminders.value = await ReminderDao.getAllReminder();
  }
}
