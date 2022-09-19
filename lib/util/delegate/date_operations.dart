class DateOperations {
  DateOperations._();

  static int differenceBetweenDays(String date) {
    final differenceBetweenDays =
        DateTime.now().difference(DateTime.parse(date)).inDays;
    return differenceBetweenDays;
  }

  static bool isWeekCompleted(String date) {
    final difference = differenceBetweenDays(date);
    final completed = ((difference) / 7 > 1) && (difference != 0);
    return completed;
  }
}
