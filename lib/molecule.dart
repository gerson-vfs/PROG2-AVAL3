import 'package:app/atom.dart';
import 'package:app/element.dart';
import 'package:app/elements.dart';

class Molecule implements Comparable<Molecule> {
  late Map<Element, int> _elements;

  Molecule(String formula) {
    this.formula = formula;
  }

  set formula(String formula) {
    _elements = split(formula);
  }

  String get formula {
    return join(_elements);
  }

  int get weight =>
      _elements.keys.fold(0, (sum, element) => sum + element.atomicNumber);

  @override
  int compareTo(Molecule other) {
    return weight.compareTo(other.weight);
  }

  static Map<Element, int> split(String formula) {
    Map<Element, int> elements = {};

    for (var element in formula.split("")) {
      if (int.tryParse(element) != null) {
        elements[elements.entries.last.key] = int.parse(
            elements.entries.last.value == 0
                ? element
                : elements.entries.last.value.toString() + element);
      } else {
        if (elements.isNotEmpty) {
          if (elements.entries.last.value == 0) {
            elements[elements.entries.last.key] = 1;
          }
        }

        elements[Atom(element).element] = 0;
      }
    }

    if (elements.isNotEmpty) {
      if (elements.entries.last.value == 0) {
        elements[elements.entries.last.key] = 1;
      }
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
