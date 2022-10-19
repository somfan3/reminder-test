class Utils {
  static int getMillisecondsDifference(DateTime date) {
    final currentTime = DateTime.now();
    return currentTime.difference(date).inMilliseconds;
  }
}
