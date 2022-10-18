import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'new_reminder_controller.dart';

class NewReminderScreen extends StatelessWidget {
  final newReminderController = Get.put(NewReminderController());

  NewReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Reminder")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              controller: newReminderController.typeController,
              decoration: const InputDecoration(hintText: "Type"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: newReminderController.timeController,
              readOnly: true,
              onTap: () async {
                var result = await selectTime(context);
                if (result != null) {
                  newReminderController.timeOfDay = result;
                  newReminderController.timeController.text =
                      result.format(context);
                }
              },
              decoration: const InputDecoration(hintText: "Time"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: newReminderController.handleSaveReminder,
              child: const Text(
                "Save",
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<TimeOfDay?> selectTime(BuildContext context) {
    return showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
  }
}
