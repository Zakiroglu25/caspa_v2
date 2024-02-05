extension ListExtension<T> on Iterable<T> {
  T? get firstOrNull => first != null ? first : null;
}
