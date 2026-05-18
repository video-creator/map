class DateFormat{
  static String convertSecondsToVideoTime(int seconds){
    if(seconds < 60){
      return "00:00:${seconds.toString().padLeft(2,"0")}";
    }
    if(seconds < 3600){
      return "00:${(seconds/60).floor().toString().padLeft(2,"0")}:${(seconds%60).toString().padLeft(2,"0")}";
    }
    return "${(seconds/3600).floor().toString().padLeft(2,"0")}:${(seconds%3600/60).floor().toString().padLeft(2,"0")}:${(seconds%60).toString().padLeft(2,"0")}";
  }
  static String convertShortSecondsToVideoTime(int seconds){
    if(seconds < 60){
      return "00:${seconds.toString().padLeft(2,"0")}";
    }
    if(seconds < 3600){
      return "00:${(seconds/60).floor().toString().padLeft(2,"0")}:${(seconds%60).toString().padLeft(2,"0")}";
    }
    return "${(seconds/3600).floor().toString().padLeft(2,"0")}:${(seconds%3600/60).floor().toString().padLeft(2,"0")}:${(seconds%60).toString().padLeft(2,"0")}";
  }
  static dayString() {
    DateTime dateTime = DateTime.now();
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2,"0")}-${dateTime.day.toString().padLeft(2,"0")}";
  }
  static daySeriString() {
    DateTime dateTime = DateTime.now();
    return "${dateTime.year}${dateTime.month.toString().padLeft(2,"0")}${dateTime.day.toString().padLeft(2,"0")}";
  }
  static dayChineseString() {
    DateTime dateTime = DateTime.now();
    return "${dateTime.year}年${dateTime.month.toString().padLeft(2,"0")}月${dateTime.day.toString().padLeft(2,"0")}日";
  }
  static weekInYear() {
    DateTime dateTime = DateTime.now();
    DateTime currentDay = DateTime(dateTime.year,dateTime.month,dateTime.day);
    DateTime firstDay = DateTime(2018);
    Duration duration = currentDay.difference(firstDay);
    int spanDays = duration.inDays;
    int firstDayWeekday = firstDay.weekday;
    int extraDays = firstDayWeekday - 1;
    int week = ((extraDays + spanDays) / 7 + 1).toInt();
    return week;
  }
  static currentTimestamp() {
    DateTime dateTime = DateTime.now();
    return dateTime.millisecondsSinceEpoch;
  }
  static monthString() {
    DateTime dateTime = DateTime.now();
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2,"0")}";
  }
  static monthSeriString() {
    DateTime dateTime = DateTime.now();
    return "${dateTime.year}${dateTime.month.toString().padLeft(2,"0")}";
  }
}