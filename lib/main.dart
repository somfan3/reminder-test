import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_1/db/dao/reminder_dao.dart';
import 'package:test_1/screens/test/test_screen.dart';
import 'package:test_1/services/notification_service.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print(
        "Native called background task: $task  data: $inputData"); //simpleTask will be emitted here.
    if (task == "reminder") {
      final reminder = await ReminderDao.getReminderById(inputData!['id']);

      NotificationService().showNotification(
          id: reminder!.id,
          title: "New Reminder",
          body:
              "Reminder: ${reminder.type} in ${reminder.time.hour}:${reminder.time.minute}");
      Workmanager().registerOneOffTask(
        "${reminder.id}",
        "reminder",
        inputData: {
          "id": reminder.id,
        },
        tag: "${reminder.id}",
        initialDelay: const Duration(days: 1),
      );
    }
    // NotificationService()
    //     .showNotification(id: inputData!['id'], title: "New Reminder", body: "Reminder: ${DateTime.now()}");

    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await NotificationService().initialize(); //

  Workmanager().initialize(
    callbackDispatcher, // The top level function, aka callbackDispatcher
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(),
    );
  }
}
