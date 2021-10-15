class SimpleBloomFilter {
  final int size;
  late final List<bool> bitArray;

  /// The bitArray is generated with length [size] and
  /// the values added are mod with the same [size].
  /// To determine this size, see https://corte.si/posts/code/bloom-filter-rules-of-thumb/
  SimpleBloomFilter(this.size) {
    bitArray = List.filled(size, false);
  }

  /// Add the value's hash to the bitArray
  void add(String key) => bitArray[key.hashCode % size] = true;

  /// Add the int's hash to the bitArray
  void addInt(int key) => add(key.toString());

  /// Add all values' hash to the bitArray
  void addAll(List<String> keys) => keys.forEach(add);

  /// Add all ints' hash to the bitArray
  void addAllInts(List<int> keys) => keys.forEach(addInt);

  /// check if the value's hash is in the bitArray
  bool check(String key) => bitArray[key.hashCode % size];

  /// check if the int's hash is in the bitArray
  bool checkInt(int key) => check(key.toString());
}
