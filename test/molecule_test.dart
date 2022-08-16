import 'package:app/atom.dart';
import 'package:app/molecule.dart';
import 'package:test/test.dart';

void main() {
  test('Molecule.join(C8H10N4O2)', () {
    Map<Atom, int> atoms = {};

    atoms[Atom("C")] = 8;
    atoms[Atom("H")] = 10;
    atoms[Atom("N")] = 4;
    atoms[Atom("O")] = 2;

    expect(Molecule.join(atoms), "C8H10N4O2"); // caffeine
  });

  test('Molecule.join(O2)', () {
    Map<Atom, int> atoms = {};

    atoms[Atom("O")] = 2;

    expect(Molecule.join(atoms), "O2");
  });

  test('Molecule.join(H2O)', () {
    Map<Atom, int> atoms = {};

    atoms[Atom("H")] = 2;
    atoms[Atom("O")] = 1;

    expect(Molecule.join(atoms), "H2O");
  });

  test('Molecule.join(NaCl)', () {
    Map<Atom, int> atoms = {};

    atoms[Atom("Na")] = 1;
    atoms[Atom("Cl")] = 1;

    expect(Molecule.join(atoms), "NaCl");
  });

  test('Molecule.join(H2SO4)', () {
    Map<Atom, int> atoms = {};

    atoms[Atom("H")] = 2;
    atoms[Atom("S")] = 1;
    atoms[Atom("O")] = 4;

    expect(Molecule.join(atoms), "H2SO4");
  });

  test('Molecule.join(C6H12O6)', () {
    Map<Atom, int> atoms = {};

    atoms[Atom("C")] = 6;
    atoms[Atom("H")] = 12;
    atoms[Atom("O")] = 6;

    expect(Molecule.join(atoms), "C6H12O6");
  });

  test("Molecule.split(C8H10N4O2)", () {
    final molecule = Molecule.split("C8H10N4O2").entries.toList();
    expect(molecule[0].key.symbol, "C");
    expect(molecule[0].value, 8);
    expect(molecule[1].key.symbol, "H");
    expect(molecule[1].value, 10);
    expect(molecule[2].key.symbol, "N");
    expect(molecule[2].value, 4);
    expect(molecule[3].key.symbol, "O");
    expect(molecule[3].value, 2);
  });

  test('Molecule.split(O2)', () {
    final molecule = Molecule.split("O2").entries.toList();
    expect(molecule[0].key.symbol, "O");
    expect(molecule[0].value, 2);
  });

  test('Molecule.split(H2O)', () {
    final molecule = Molecule.split("H2O").entries.toList();
    expect(molecule[0].key.symbol, "H");
    expect(molecule[0].value, 2);
    expect(molecule[1].key.symbol, "O");
    expect(molecule[1].value, 1);
  });

  // test('Molecule.split(NaCl)', () {
  //   final molecule = Molecule.split("NaCl").entries.toList();
  //   expect(molecule[0].key.symbol, "Na");
  //   expect(molecule[0].value, 1);
  //   expect(molecule[1].key.symbol, "Cl");
  //   expect(molecule[1].value, 1);
  // });

  test('Molecule.split(H2SO4)', () {
    final molecule = Molecule.split("H2SO4").entries.toList();
    expect(molecule[0].key.symbol, "H");
    expect(molecule[0].value, 2);
    expect(molecule[1].key.symbol, "S");
    expect(molecule[1].value, 1);
    expect(molecule[2].key.symbol, "O");
    expect(molecule[2].value, 4);
  });

  test('Molecule.split(C6H12O6)', () {
    final molecule = Molecule.split("C6H12O6").entries.toList();
    expect(molecule[0].key.symbol, "C");
    expect(molecule[0].value, 6);
    expect(molecule[1].key.symbol, "H");
    expect(molecule[1].value, 12);
    expect(molecule[2].key.symbol, "O");
    expect(molecule[2].value, 6);
  });

  test('Molecule.split(C6H12O6)', () {
    final molecule = Molecule.split("C6H12O6").entries.toList();
    expect(molecule[0].key.symbol, "C");
    expect(molecule[0].value, 6);
    expect(molecule[1].key.symbol, "H");
    expect(molecule[1].value, 12);
    expect(molecule[2].key.symbol, "O");
    expect(molecule[2].value, 6);
  });
}
