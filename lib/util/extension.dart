import 'dart:developer' show log;

enum PersonUrl { person1, persons2 }

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.person1:
        return "";

      case PersonUrl.persons2:
        return "";
    }
  }
}

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

extension Log on Object? {
  void logToConsole() => log(toString());
}
