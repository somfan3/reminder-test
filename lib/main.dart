import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/screens/test/test_screen.dart';
import 'package:test_1/services/notification_service.dart';

Future<void> main() async {
  await NotificationService().initialize(); //
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
      home: const TestScreen(),
    );
  }
}
