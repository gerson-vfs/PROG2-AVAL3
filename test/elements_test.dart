import 'package:app/Elements.dart';
import 'package:test/test.dart';

void main() {
  test("Elements Singleton", () {
    var e1 = Elements();
    var e2 = Elements();
    expect(e1, e2);
  });
}
