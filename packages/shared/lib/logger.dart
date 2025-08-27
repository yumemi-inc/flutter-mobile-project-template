import 'package:simple_logger/simple_logger.dart';

class AppLogger {
  AppLogger._();

  static final _instance = AppLogger._();

  late final SimpleLogger _logger;
  var _isInitialized = false;

  void initialize({bool isDebugMode = false}) {
    if (_isInitialized) {
      return;
    }

    _logger = SimpleLogger()
      ..setLevel(
        Level.FINEST,
        includeCallerInfo: isDebugMode,
      );
    _isInitialized = true;
  }

  SimpleLogger get logger {
    if (!_isInitialized) {
      throw StateError('Logger not initialized. Call initialize() first.');
    }
    return _logger;
  }
}

final AppLogger appLogger = AppLogger._instance;
