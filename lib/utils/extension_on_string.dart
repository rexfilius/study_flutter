extension StringExt on String? {
  bool get isBlank {
    this?.trim();
    if (this != null && this!.isNotEmpty) return false;
    return true;
  }

  bool get isNotBlank {
    return !isBlank;
  }
}
