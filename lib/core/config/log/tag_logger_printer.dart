import 'package:logger/logger.dart';

class TagPrefixPrinter extends LogPrinter {
  final LogPrinter _realPrinter;
  final String defaultTag;
  late Map<Level, String> _prefixMap;

  TagPrefixPrinter(this._realPrinter,
      {debug, verbose, wtf, info, warning, error, this.defaultTag = "NoTag"}) {
    _prefixMap = {
      Level.debug: debug ?? 'DEBUG',
      Level.verbose: verbose ?? 'VERBOSE',
      Level.wtf: wtf ?? 'WTF',
      Level.info: info ?? 'INFO',
      Level.warning: warning ?? 'WARNING',
      Level.error: error ?? 'ERROR',
    };
  }

  @override
  List<String> log(LogEvent event) {
    if (event.message is LogMessage) {
      var message = event.message as LogMessage;

      var logEvent = LogEvent(
        event.level,
        message.message,
        event.error,
        event.stackTrace,
      );

      var realLogs = _realPrinter.log(logEvent);
      var appendedLogs =
          appendTag(realLogs, event.level, message.tag ?? defaultTag);
      return appendedLogs;
    } else {
      var realLogs = _realPrinter.log(event);
      return appendLevel(realLogs, event.level);
    }
  }

  List<String> appendTag(List<String> realLogs, Level level, String tag) =>
      realLogs.map((s) => '${_prefixMap[level]}: [$tag] $s').toList();

  List<String> appendLevel(List<String> realLogs, Level level) =>
      realLogs.map((s) => '${_prefixMap[level]}: $s').toList();
}

class LogMessage {
  LogMessage({this.message, this.tag});

  final dynamic message;
  final String? tag;
}
