import 'package:app/atom.dart';

class Molecule implements Comparable<Molecule> {
  late Map<Atom, int> _atoms;

  Molecule(String formula) {
    this.formula = formula;
  }

  set formula(String formula) {
    _atoms = split(formula);
  }

  String get formula {
    return join(_atoms);
  }

  int get weight {
    throw UnimplementedError();
  }

  @override
  int compareTo(Molecule other) {
    throw UnimplementedError();
  }

  static Map<Atom, int> split(String formula) {
    Map<Atom, int> atoms = {};

    for (var atom in formula.split("")) {
      if (int.tryParse(atom) != null) {
        atoms[atoms.entries.last.key] = int.parse(atoms.entries.last.value == 0
            ? atom
            : atoms.entries.last.value.toString() + atom);
      } else {
        if (atoms.isNotEmpty) {
          if (atoms.entries.last.value == 0) {
            atoms[atoms.entries.last.key] = 1;
          }
        }

        atoms[Atom(atom)] = 0;
      }
    }

    if (atoms.isNotEmpty) {
      if (atoms.entries.last.value == 0) {
        atoms[atoms.entries.last.key] = 1;
      }
    }

    return atoms;
  }

  static String join(Map<Atom, int> atoms) {
    String formula = '';

    for (var atom in atoms.entries) {
      formula += atom.key.symbol;

      if (atom.value > 1) {
        formula += atom.value.toString();
      }
    }

    return formula;
  }
}
