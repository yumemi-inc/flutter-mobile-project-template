import 'dart:developer' as dev;
import 'dart:io' as io;

final _useAnsi = io.stdout.supportsAnsiEscapes &&
    io.stdioType(io.stdout) == io.StdioType.terminal;
final _red = _code('\u001b[31m');
final _bold = _code('\u001b[1m');
final _none = _code('\u001b[0m');

String _emphasized(String message) => '$_bold$message$_none';

String _error(String message) => '$_red$message$_none';

String _code(String ansiCode) => _useAnsi ? ansiCode : '';

void log(String message) {
  final lines = message.trimRight().split('\n');
  dev.log("  ${lines.join('\n  ')}");
}

Never fail(String message) {
  log(_emphasized('failed: ') + _error(message));
  throw Exception(message);
}
