class Utils {
  static int getMillisecondsDifference(DateTime date) {
    final currentTime = DateTime.now();
    final now = DateTime(currentTime.year, currentTime.month, currentTime.day,
        currentTime.hour, currentTime.minute);
    print("current time ${currentTime}");
    print("data ${date}");
    return (currentTime.difference(date).inMilliseconds * -1) -  currentTime.millisecond;
  }
}
