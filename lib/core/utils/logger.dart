import 'package:logger/logger.dart';

late final Logger _logger;
Logger get logger => _logger;

class NewlyLogger {
  NewlyLogger._();

  static void config() {
    _logger = Logger();
  }
}
