

abstract class HeaderState {

}

class HeaderInitial extends HeaderState {}

class HeaderInProgress extends HeaderState {

  HeaderInProgress({this.headerResult});
  HeaderResult?  headerResult;
}

class HeaderInUpdate extends HeaderState {
  /// CompilationsInUpdate(this.compilations);
  ///
  /// final List<Compilations> compilations;
}

class HeaderError extends HeaderState {}
class HeaderNetworkError extends HeaderState {}

class HeaderSuccess extends HeaderState {
  HeaderSuccess(this.headerResult);
  final HeaderResult  headerResult;

}

///
class HeaderResult{}