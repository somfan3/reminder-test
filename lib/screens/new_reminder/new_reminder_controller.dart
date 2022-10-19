import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/app/date_extension.dart';
import 'package:test_1/app/utils/utils.dart';
import 'package:test_1/db/dao/reminder_dao.dart';
import 'package:test_1/db/entities/reminder.dart';
import 'package:test_1/screens/test/test_controller.dart';
import 'package:workmanager/workmanager.dart';

class NewReminderController extends GetxController {
  final typeController = TextEditingController();
  final timeController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();

  handleSaveReminder() async {
    Reminder newReminder = Reminder(
      id: Random().nextInt(999999999),
      time: timeOfDay,
      type: typeController.text,
      frequency: Frequency(
        type: FrequencyType.daysOfWeek,
        days: [1, 2, 3],
      ),
    );

    var isSuccess = await ReminderDao.insertReminder(newReminder);
    var times = newReminder.time;

    if (isSuccess) {
      var mili =
      Utils.getMillisecondsDifference(DateTime.now().applied(timeOfDay));
      print(mili * -1);
      Workmanager().registerPeriodicTask(
        "${newReminder.id}",
        "reminder",
        inputData: {
          "id": newReminder.id,
        },
        tag: "${newReminder.id}",
        frequency: const Duration(days: 1),
        initialDelay: Duration(seconds: mili * -1),
      );
      Get.find<TestController>().getReminders();
      Get.back();
    }
  }
}
