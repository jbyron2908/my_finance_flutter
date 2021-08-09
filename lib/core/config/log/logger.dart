import 'package:logger/logger.dart';

import '../flavor/index.dart';

class Log {
  Log._();

  static final Logger _logger = _getLogger(Flavor.type);

  static void v(String tag, dynamic message) {
    _logger.v("[$tag] - $message");
  }

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }

  static Logger _getLogger(FlavorType flavorType) {
    Logger logger;

    switch (flavorType) {
      case FlavorType.dev:
        logger = _getDevLogger();
        break;
      case FlavorType.production:
        logger = _getProdLogger();
        break;
      default:
        logger = _getDevLogger();
    }

    return logger;
  }

  static Logger _getDevLogger() {
    return Logger(
      printer: PrefixPrinter(PrettyPrinter()),
    );
  }

  static Logger _getProdLogger() {
    return Logger();
  }
}
