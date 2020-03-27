import 'dart:convert';
import 'dart:math';

class simple_bloom_filter {
  final int _size;
  final int _hashNum;
  List<int> hashList;
  List<bool> bitArray;
  final int _min;
  final int _max;
  //m number of bits in the array
  //n the elements
  //k number of hash functions
  simple_bloom_filter(size, hashCount)
    : _size = size,
     bitArray = List.filled(size, false),
     _hashNum = hashCount,
     _min = 1000,
     _max = 9999;

  void generateHashes() {
    hashList = List(_hashNum);
    for(var i = 0; i < _hashNum; i++) {
      hashList[i] = _min + Random().nextInt(_max - _min);
    }
  }

  BigInt _hash(String key, int hashInt) {
    var hash = BigInt.from(hashInt);
    var keyList = utf8.encode(key);
    int char;
    for (char in keyList) {
      hash = ((hash << 5) + hash) + BigInt.from(char);
    }
    return hash;
  }

  void add(String key) {
    if (hashList == null) {
      generateHashes();
    }
    for (var hash in hashList) {
      bitArray[(_hash(key, hash) % BigInt.from(_size)).toInt()] = true;
    }
  }

  bool check(String key) {
    if (hashList == null) {
      return false;
    }
    for (var hash in hashList) {
      if (bitArray[(_hash(key, hash) % BigInt.from(_size)).toInt()]) {
        return true;
      }
    }
    return false;
  }
}