import 'package:logger/logger.dart';
import 'package:my_finance_flutter_3/core/config/log/tag_logger_printer.dart';

import '../flavor/index.dart';

class Log {
  Log._();

  static final Logger _logger = _getLogger(Flavor.type);

  static void v(dynamic message, {String? tag}) {
    _logger.v(LogMessage(message: message, tag: tag));
  }

  static void i(dynamic message, {String? tag}) {
    _logger.i(LogMessage(message: message, tag: tag));
  }

  static void d(dynamic message, {String? tag}) {
    _logger.d(LogMessage(message: message, tag: tag));
  }

  static void w(dynamic message, {String? tag}) {
    _logger.w(LogMessage(message: message, tag: tag));
  }

  static void e(dynamic message, {String? tag}) {
    _logger.e(LogMessage(message: message, tag: tag));
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
      printer: TagPrefixPrinter(
        PrettyPrinter(
          stackTraceBeginIndex: 2,
        ),
      ),
    );
  }

  static Logger _getProdLogger() {
    return Logger();
  }
}
