// Flutter imports:
import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../infrastructure/configs/recorder.dart';
import '../../infrastructure/models/remote/response/delivery_address_model.dart';
import '../../infrastructure/services/hive_service.dart';
import '../../locator.dart';

class CourierOperations {
  static HiveService get _prefs => locator<HiveService>();

  static DeliveryAddress? determineSelecteAddress(
      {required List<DeliveryAddress>? addresses}) {
    try {
      final selected =
          addresses?.where((element) => element.id == _prefs.address.id);
      if (selected != null && selected.isNotEmpty) {
        _prefs.persistAddress(address: selected.first);
        return selected.first;
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
    return null;
  }
}
