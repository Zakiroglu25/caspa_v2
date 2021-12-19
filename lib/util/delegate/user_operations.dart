
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';

import '../../locator.dart';

class UserOperations {
  static PreferencesService get _prefs => locator<PreferencesService>();

  static Future<void> configureUserData(
      //MyUser user,
          {required String fcmToken,
        required String accessToken}) async {
    //llll("configureUserData result result: " + user.toString());

    //final result = await AccountProvider.fetchUserInfo(token: '201|h4MgubsbiWi39sLDgSbLaHe8LLpGk1J5tWrI1SrR');

    await _prefs.persistIsGuest(false);
    await _prefs.persistIsLoggedIn(true);
    await _prefs.persistAccessToken(accessToken: accessToken);
    await _prefs.persistFcmToken(fcmToken: fcmToken);

  }


}

