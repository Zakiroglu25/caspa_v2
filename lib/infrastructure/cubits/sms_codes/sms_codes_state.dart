import 'package:caspa_v2/infrastructure/models/remote/response/contact_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

import '../../models/remote/response/sms_code_model.dart';

abstract class SmsCodesState {}

class SmsCodesInitial extends SmsCodesState {}

class SmsCodesInProgress extends SmsCodesState {}

class SmsCodesError extends SmsCodesState {
  String? error;

  SmsCodesError({this.error});
}

class SmsCodesNetworkError extends SmsCodesState {}

class SmsCodesSuccess extends SmsCodesState {
  SmsCodesSuccess(this.smsList);

  final List<SmsCode> smsList;
}