import 'package:app/errors/invalid_symbol.dart';

class Molecule {
  late String _formula;

  Molecule(String formula) {
    this.formula = formula;
  }

  set formula(String formula) {
    _formula = formula;

    if (!_isValidFormula(formula)) {
      throw InvalidSymbolError(formula);
    }
  }

  String get formula {
    return _formula;
  }

  int get weight {
    return _getAtomWeight("");
  }

  bool _isValidFormula(String formula) {
    return true;
  }

  int _getAtomWeight(String symbol) {
    return 0;
  }
}
