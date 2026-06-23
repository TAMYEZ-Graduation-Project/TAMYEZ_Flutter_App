extension DateParsingExtension on String {
  DateTime toDateTime() {
    return DateTime.parse(this).toLocal();
  }

  String toYMD() {
    final date = DateTime.parse(this);
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
}
