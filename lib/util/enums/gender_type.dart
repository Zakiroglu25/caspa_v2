enum GenderType { man, woman, unselected }

extension ParseToString on GenderType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}