import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/db/entities/reminder.dart';
import 'package:test_1/screens/new_reminder/new_reminder_screen.dart';
import 'package:test_1/widgets/reminder_card.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFAB(),
      appBar: AppBar(title: const Text("Test")),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ReminderCard(
                reminder: Reminder(
                  type: "Water",
                  id: 0,
                  frequency: Frequency(
                    type: FrequencyType.everyDay,
                    days: [],
                  ),
                  time: const TimeOfDay(hour: 14, minute: 37),
                ),
              )
            ],
          )),
    );
  }

  _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => NewReminderScreen());
      },
      child: const Icon(Icons.add),
    );
  }
}
