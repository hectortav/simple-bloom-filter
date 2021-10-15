# simple_bloom_filter 🎯

A simple Dart implementation of a bloom filter. [Bloom filters](https://en.wikipedia.org/wiki/Bloom_filter) are a space-efficient probabilistic data structure that is used to test whether an element is a member of a set.

## usage

```dart
final bloom = SimpleBloomFilter(10000);
bloom.add('hello world');
if (bloom.check('hello world') == true) {
    print('"hello world" PROBABLY exists...');
}
```

## Features

- Choose size of bit array

## Features to come

- Better hash functions
- Choose false positive probability