class Utils {
  static int getMillisecondsDifference(DateTime date) {
    final currentTime = DateTime.now();
    final now = DateTime(currentTime.year, currentTime.month, currentTime.day,
        currentTime.hour, currentTime.minute);

    return now.difference(date).inMilliseconds;
  }
}
