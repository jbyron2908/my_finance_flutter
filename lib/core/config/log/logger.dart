import 'package:logger/logger.dart';

import '../flavor/index.dart';

class Log {
  static final Logger _logger = _getLogger(Flavor.type);

  static void v(dynamic message) {
    _logger.v(message);
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
      case FlavorType.DEV:
        logger = _getDevLogger();
        break;
      case FlavorType.PRODUCTION:
        logger = _getProdLogger();
        break;
      default:
        logger = _getDevLogger();
    }

    return logger;
  }

  static Logger _getDevLogger() {
    return Logger();
  }

  static Logger _getProdLogger() {
    return Logger();
  }
}
