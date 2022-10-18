import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/db/dao/reminder_dao.dart';
import 'package:test_1/db/entities/reminder.dart';
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
      Workmanager().registerPeriodicTask(
        "${newReminder.id}",
        "reminder",
        inputData: {
          "id": newReminder.id,
          "type": newReminder.type,
          "time": "${times.hour}:${times.minute}"
        },
        frequency: const Duration(minutes: 15),
        initialDelay: const Duration(milliseconds: 10000),
      );
    }
  }
}
