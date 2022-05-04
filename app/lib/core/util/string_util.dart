class StringUtil {
  static String enumName(String value) {
    return value.toString().substring(value.toString().indexOf('.') + 1);
  }
}
