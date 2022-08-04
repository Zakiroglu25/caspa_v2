extension Word on String {
  String get first => split(' ').first;
  String get notEmpty => (split(',').first.length > 2) ? this : '';
}
