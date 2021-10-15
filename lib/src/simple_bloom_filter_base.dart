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
  void add(Object key) => bitArray[key.hashCode % size] = true;

  /// Add all values' hash to the bitArray
  void addAll(List<Object> keys) => keys.forEach(add);

  /// check if the value's hash is in the bitArray
  bool check(Object key) => bitArray[key.hashCode % size];
}
