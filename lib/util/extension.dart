import 'dart:developer' show log;

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

extension Log on Object? {
  void logToConsole() => log(toString());
}

extension IsEqualIgnoringOrdering<T> on Iterable<T> {
  bool isEqualIgnoringOrdering(Iterable<T> other) {
    return length == other.length &&
        {...this}.intersection({...other}).length == length;
  }
}
