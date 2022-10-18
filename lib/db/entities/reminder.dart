import 'dart:convert';

import 'package:flutter/material.dart';

enum FrequencyType {
  everyDay,
  daysOfWeek,
  daysOfMonth,
}

class Reminder {
  final int id;
  final String type;
  final TimeOfDay time;
  final Frequency frequency;

  const Reminder({
    required this.id,
    required this.time,
    required this.type,
    required this.frequency,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    var times = json['time'].split(":");

    return Reminder(
      id: json['id'],
      time: TimeOfDay(hour: times[0], minute: times[1]),
      type: json['type'],
      frequency: Frequency.fromJson(json['frequency']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "time": "${time.hour}:${time.minute}",
        "frequency": jsonEncode(frequency.toJson())
      };
}

class Frequency {
  final FrequencyType type;
  final List<int> days;

  Frequency({required this.type, required this.days});

  factory Frequency.fromJson(Map<String, dynamic> json) => Frequency(
        type: FrequencyType.values.firstWhere(
          (element) => element.name == json['type'],
        ),
        days: json['days'].split(",").map((e) => int.parse(e)),
      );

  Map<String, dynamic> toJson() => {
        "type": type.name,
        "days": days.join(","),
      };
}
