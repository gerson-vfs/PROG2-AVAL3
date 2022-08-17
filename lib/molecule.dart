import 'package:app/atom.dart';
import 'package:app/element.dart';

class Molecule implements Comparable<Molecule> {
  late Map<Element, int> _elements;
  late String _name;

  Molecule({required String formula, required String name}) {
    this.formula = formula;
  }

  set formula(String formula) {
    _elements = split(formula);
  }

  String get formula {
    return join(_elements);
  }

  String get name => _name;

  int get weight {
    var total = 0;

    _elements.forEach((element, count) {
      total += element.weight * count;
    });

    return total;
  }

  @override
  int compareTo(Molecule other) {
    return weight.compareTo(other.weight);
  }

  static Map<Element, int> split(String formula) {
    if (formula.isEmpty) {
      return {};
    }

    isInt(String text) {
      return int.tryParse(text) != null;
    }

    isLowerCase(String text) {
      return text.toLowerCase() == text;
    }

    Map<Element, int> elements = {};

    String atom = "";

    for (var i = 0; i < formula.length; i++) {
      atom += formula[i];

      if (i + 1 < formula.length) {
        var next = formula[i + 1];
        if (!isInt(next)) {
          if (isLowerCase(next)) {
            atom += next;
            i++;
          }
        }
      }

      if (i + 1 < formula.length) {
        var current = formula[i];
        var next = formula[i + 1];
        if (!isInt(current) && !isInt(next)) {
          atom += "1 ";
        }

        if (isInt(current) && !isInt(next)) {
          atom += " ";
        }
      } else {
        var current = formula[i];
        if (!isInt(current)) {
          atom += "1";
        }
      }
    }

    for (var atom in atom.split(" ")) {
      var element = atom.split(RegExp(r'\d+'))[0];
      var count = atom.split(RegExp(r'[A-z]+'))[1];

      elements[Atom(element).element] = int.parse(count);
    }

    return elements;
  }

  static String join(Map<Element, int> elements) {
    String formula = '';

    for (var element in elements.entries) {
      formula += element.key.symbol;

      if (element.value > 1) {
        formula += element.value.toString();
      }
    }

    return formula;
  }
}
