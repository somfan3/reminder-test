import 'package:flutter/material.dart';
import 'package:test_1/db/entities/reminder.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final GestureTapCallback? onTap;

  const ReminderCard({
    Key? key,
    required this.reminder,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: FlutterLogo(),
            ),
            SizedBox(width: 16),
            Column(
              children: [
                Text(reminder.type),
                SizedBox(height: 24),
                Text("plant A"),
              ],
            ),
            Spacer(),
            Text("${reminder.time.format(context)}")
          ],
        ),
      ),
    );
  }
}
