import 'package:app/errors/generic.dart';

class InvalidSymbolError extends GenericError {
  InvalidSymbolError(String message) : super('Invalid symbol: $message');
}
