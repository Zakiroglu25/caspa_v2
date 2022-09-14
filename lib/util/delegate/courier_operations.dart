// Flutter imports:
import '../../infrastructure/configs/recorder.dart';
import '../../infrastructure/models/remote/response/delivery_address_model.dart';
import '../../infrastructure/services/hive_service.dart';
import '../../locator.dart';

class CourierOperations {
  static HiveService get _prefs => locator<HiveService>();

  static DeliveryAddress? determineSelectedAddress(
      {required List<DeliveryAddress>? addresses}) {
    try {
      final selected =
          addresses?.where((element) => element.id == _prefs.address?.id);
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
