import 'dart:math';

import 'package:simple_bloom_filter/simple_bloom_filter.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      final bloom = SimpleBloomFilter(10000);
      bloom.add('hello world');
      bloom.add('this is just a test');
      bloom.add('Dart is fun!');
      bloom.add(1234567890);
      bloom.add('{"first-name": "Dart", "last-name": "lang"}');

      expect(bloom.check('hello world'), isTrue);
      expect(bloom.check('this is just a test'), isTrue);
      expect(bloom.check('Dart is fun!'), isTrue);
      expect(bloom.check(1234567890), isTrue);
      expect(bloom.check('{"first-name": "Dart", "last-name": "lang"}'), isTrue);
      expect(bloom.check('{"first-name": "Go", "last-name": "lang"}'), isFalse);
    });

    int? _lastTime;
    void _printTime(String message) {
      final now = DateTime.now().millisecondsSinceEpoch;
      print('$now (${now - (_lastTime ?? now)}): $message');
      _lastTime = now;
    }

    // ...566 (0): Setting up the test...
    // ...576 (10): Starting Bloom search 5000 elements in list with 50000 elements
    // ...579 (3): found 2780 possible matches, 2220 are not needed to check
    // ...579 (0): Starting normal search 5000 elements in list with 50000 elements
    // ...831 (252): found 347 matches
    // ✓ A group of tests Speed check
    test('Speed check', () {
      _printTime('Setting up the test...');
      final random = Random();
      const testSize = 50000;
      const matchRate = 0.1;
      final testList = List.generate(testSize, (index) => testSize + index * random.nextInt(4))..shuffle(random);
      const searchSize = 5000;
      final searhList = List.generate(searchSize, (index) => random.nextInt((testSize / matchRate).floor()));
      final bloom = SimpleBloomFilter(testSize);
      _printTime('Starting Bloom search $searchSize elements in list with $testSize elements');
      bloom.addAll(testList);
      final toCheck = searhList.where(bloom.check).length;
      _printTime('found $toCheck possible matches, ${searchSize - toCheck} are not needed to check');
      _printTime('Starting normal search $searchSize elements in list with $testSize elements');
      final total = searhList.where((e) => testList.contains(e)).length;
      _printTime('found $total matches');
    });
  });
}
