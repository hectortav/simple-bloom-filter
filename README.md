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

## comparison to contains (see test)
...566 (0): Setting up the test...
...576 (10): Starting Bloom search 5000 elements in list with 50000 elements
...579 (3): found 2780 possible matches, 2220 are not needed to check
...579 (0): Starting normal search 5000 elements in list with 50000 elements
...831 (252): found 347 matches
✓ A group of tests Speed check

Using a simple bloom configuration where the bit == the test list size
5k searches in 50k items takes 252ms, using bloom it can say that half (2220) are not needed to check in 3ms!. So it can save you 123ms in this example. 
When the size of the to-search list increases, bloom becomes more and more usefull!

## Features

- Choose size of bit array

## Features to come

- Better hash functions
- Choose false positive probability