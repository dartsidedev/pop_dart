import 'package:pop_dart/map.dart';
import 'package:test/test.dart';

void main () {
  group(DefaultMap, () {
    test('', () {
      final m = DefaultMap.forBools<String>();
      expect(m.isEmpty, true);
      expect(m.isNotEmpty, false);
      m['a'] = true;
      m['b'] = false;
      expect(m['a'], true);
      expect(m['b'], false);
      expect(m['c'], false);
      expect(m['d'], false);
      m['c'] = true;
      expect(m['c'], true);
      expect(m['d'], false);
      expect(m.isEmpty, false);
      expect(m.isNotEmpty, true);
      m.clear();
      expect(m['a'], false);
      expect(m['b'], false);
      expect(m['c'], false);
      expect(m['d'], false);
      expect(m.isEmpty, true);
      expect(m.isNotEmpty, false);
    });

    test('nullable is handled', () {
      final m = DefaultMap<String, String?>.withValue('none');
      m['a'] = 'A';
      m['b'] = null;
      expect(m['a'], 'A');
      expect(m['b'], null);
      expect(m['c'], 'none');
    });
  });
}