import 'package:bloom_filter/bloom_filter.dart';

void main() {
  var bloom = BloomFilter(10000, 3);

  bloom.add('hello world');
  bloom.add(1234567890.toString());
  bloom.add('{"first-name": "Dart", "last-name": "lang"}');

  if (bloom.check('hello world') == true) {
    print('"hello world" PROBABLY exists...');
  }
  else {
    print('"hello world" DEFINITELY does not exist...');
  }
  if (bloom.check(1234567890.toString()) == true) {
    print('"1234567890" PROBABLY exists...');
  }
  else {
    print('"1234567890" DEFINITELY does not exist...');
  }
  if (bloom.check('{"first-name": "Dart", "last-name": "lang"}') == true) {
    print('"{"first-name": "Dart", "last-name": "lang"}" PROBABLY exists...');
  }
  else {
    print('"{"first-name": "Dart", "last-name": "lang"}" DEFINITELY does not exist...');
  }
  if (bloom.check('{"first-name": "Go", "last-name": "lang"}') == true) {
    print('"{"first-name": "Go", "last-name": "lang"}" PROBABLY exists...');
  }
  else {
    print('"{"first-name": "Go", "last-name": "lang"}" DEFINITELY does not exist...');
  }
}
