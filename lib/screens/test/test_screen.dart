import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/db/entities/reminder.dart';
import 'package:test_1/screens/new_reminder/new_reminder_screen.dart';
import 'package:test_1/screens/test/test_controller.dart';
import 'package:test_1/widgets/reminder_card.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TestController controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFAB(),
      appBar: AppBar(title: const Text("Test")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() => ListView.builder(
            itemCount: controller.reminders.length,
            itemBuilder: (context, index) {
              return ReminderCard(reminder: controller.reminders[index]);
            })),
      ),
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
