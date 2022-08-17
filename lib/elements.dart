import 'dart:io';
import 'package:app/element.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() => _singleton;

  Singleton._internal();
}

class Elements {
  static final Elements _singleton = Elements._internal();
  factory Elements() => _singleton;
  Elements._internal() {
    load("lib/elements.csv");
  }

  final List<Element> _elements = [];
  List<Element> get elements => _elements;

  void forEach(void Function(Element) f) {
    _elements.forEach(f);
  }

  load(String path) {
    var file = File(path);
    var contents = file.readAsStringSync();
    var lines = contents.split('\n');
    lines.removeAt(0);
    for (var line in lines) {
      if (line.isNotEmpty) {
        var fields = line.split(',');
        _elements.add(Element(
          int.parse(fields[0]),
          fields[1],
          fields[2],
          fields[3],
        ));
      }
    }
  }
}
