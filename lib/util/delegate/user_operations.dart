import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/services/firestore_service.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class UserOperations {
  static PreferencesService get _prefs => locator<PreferencesService>();

  static Future<void> configureUserData(
      //MyUser user,
      {required String fcmToken,
      required String accessToken,
      required String? path}) async {
    //llll("configureUserData result result: " + user.toString());
try{    await _prefs.persistAccessToken(accessToken: accessToken);
await _prefs.persistIsGuest(false);
await _prefs.persistPath(path!);
await _prefs.persistIsLoggedIn(true);
await _prefs.persistFcmToken(fcmToken: fcmToken);
final result = await AccountProvider.fetchUserInfo(token: accessToken);
await FirestoreDBService.readConfig();
await FirestoreDBService.saveUserPath(result!.data, path,fcmToken,accessToken);}
catch(e,s){

  bbbb("e: $e => s: $s");

}
  }
}
