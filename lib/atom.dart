import 'package:app/Elements.dart';
import 'package:app/errors/invalid_symbol.dart';

class Atom {
  final String symbol;
  Atom(this.symbol) {
    if (!isValid(symbol)) {
      throw InvalidSymbolError(symbol);
    }
  }

  static bool isValid(String symbol) {
    final elements = Elements();

    for (var element in elements.elements) {
      if (element.symbol == symbol) {
        return true;
      }
    }

    return false;
  }

  @override
  String toString() {
    return 'Atom($symbol)';
  }
}
