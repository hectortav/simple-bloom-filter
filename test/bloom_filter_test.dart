import 'package:bloom_filter/bloom_filter.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    BloomFilter bloom;

    setUp(() {
      bloom = BloomFilter(10000, 3);
    });

    test('First Test', () {
      bloom.add('hello world');
      bloom.add('this is just a test');
      bloom.add('Dart is fun!');
      bloom.add(1234567890.toString());
      bloom.add('{"first-name": "Dart", "last-name": "lang"}');

      expect(bloom.check('hello world'), isTrue);
      expect(bloom.check('this is just a test'), isTrue);
      expect(bloom.check('Dart is fun!'), isTrue);
      expect(bloom.check(1234567890.toString()), isTrue);
      expect(bloom.check('{"first-name": "Dart", "last-name": "lang"}'), isTrue);
      expect(bloom.check('{"first-name": "Go", "last-name": "lang"}'), isFalse);
    });
  });
}