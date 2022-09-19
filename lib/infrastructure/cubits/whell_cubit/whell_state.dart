import 'package:caspa_v2/infrastructure/models/remote/response/wares.dart';

import '../../models/remote/response/wheel_response.dart';

abstract class WheelState {}

class WheelInitial extends WheelState {}

class WheelInProgress extends WheelState {}

class WheelError extends WheelState {
  String? error;

  WheelError({this.error});
}

class WheelSuccess extends WheelState {
  WheelSuccess(this.wheel);

  String? wheel;
}

class WheelNetworkError extends WheelState {}
