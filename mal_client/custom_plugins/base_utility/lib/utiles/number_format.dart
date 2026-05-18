class NumberFormat {
  static String bigNumberToString(int number) {
    if(number < 1000) return number.toString();
    if(number < 10000) {
      return "${(number.toDouble() / 1000.0).toStringAsFixed(2)}千";
    }
    if(number < 100000000) {
      return "${(number.toDouble() / 10000.0).toStringAsFixed(2)}万";
    }
    return "${(number.toDouble() / 100000000.0).toStringAsFixed(2)}亿";
  }
}