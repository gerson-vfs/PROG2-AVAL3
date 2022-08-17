import 'package:app/atom.dart';
import 'package:app/element.dart';
import 'package:app/elements.dart';
import 'package:app/molecule.dart';
import 'package:test/test.dart';

void main() {
  Elements();

  test('Molecule.join(C8H10N4O2)', () {
    Map<Element, int> elemnts = {};

    elemnts[Atom("C").element] = 8;
    elemnts[Atom("H").element] = 10;
    elemnts[Atom("N").element] = 4;
    elemnts[Atom("O").element] = 2;

    expect(Molecule.join(elemnts), "C8H10N4O2"); // caffeine
  });

  test('Molecule.join(O2)', () {
    Map<Element, int> elemnts = {};

    elemnts[Atom("O").element] = 2;

    expect(Molecule.join(elemnts), "O2");
  });

  test('Molecule.join(H2O)', () {
    Map<Element, int> elemnts = {};

    elemnts[Atom("H").element] = 2;
    elemnts[Atom("O").element] = 1;

    expect(Molecule.join(elemnts), "H2O");
  });

  test('Molecule.join(NaCl)', () {
    Map<Element, int> elemnts = {};

    elemnts[Atom("Na").element] = 1;
    elemnts[Atom("Cl").element] = 1;

    expect(Molecule.join(elemnts), "NaCl");
  });

  test('Molecule.join(H2SO4)', () {
    Map<Element, int> elemnts = {};

    elemnts[Atom("H").element] = 2;
    elemnts[Atom("S").element] = 1;
    elemnts[Atom("O").element] = 4;

    expect(Molecule.join(elemnts), "H2SO4");
  });

  test('Molecule.join(C6H12O6)', () {
    Map<Element, int> elemnts = {};

    elemnts[Atom("C").element] = 6;
    elemnts[Atom("H").element] = 12;
    elemnts[Atom("O").element] = 6;

    expect(Molecule.join(elemnts), "C6H12O6");
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
