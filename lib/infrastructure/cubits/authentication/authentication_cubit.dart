import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/sentry_helper.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../locator.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  PreferencesService get _prefs => locator<PreferencesService>();
  MyUser? userData = MyUser();

  //RenewTokenService get _token => locator<RenewTokenService>();

  bool? goOn;

  void startApp(BuildContext context, {bool showSplash = true}) async {
    ///aaaa('1');

    if (showSplash) {
      emit(AuthenticationSplash());
    } else {
      emit(AuthenticationLoading());
    }

    try {
      configureFcm(context: context);
      final bool isLoggedIn = await _prefs.isLoggedIn;
      final String? accessToken = await _prefs.accessToken;
      if (isLoggedIn && accessToken != null) {
        //userin girish edib etmemeyi yoxlanilir

        await Future.wait([
          //splah screen ucun min 4 san. gozledilir
          delay(showSplash),
          // eyni zamanda konfiqurasiya edilir
          configUserData(context: context, accessToken: accessToken)
        ]);
        // if (goOn!) {
        // aaaa('4');

        emit(AuthenticationAuthenticated());
        //}
      } else {
        await Future.wait([
          delay(showSplash),
          // configGuest(context),
        ]);

        //  if (goOn!) {
        emit(AuthenticationUninitialized());
        //Go.to(context, Pager.login);
        // }
      }
    } on SocketException catch (_) {
      emit(AuthenticationNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      eeee("AuthenticationError: $s" + e.toString());
      emit(AuthenticationError());
    }
  }

  Future<void> configUserData(
      {required BuildContext context, required accessToken}) async {
    final result = await AccountProvider.fetchUserInfo(token: accessToken);
    print("token: " + accessToken.toString());

    userData = result?.data;

    await serverControl(result, () async {
      //sorgu gonderilir ,xeta yaranarsa ve ya serverle bagli sehvlik olarsa
      //server error sehifesini goterir
      Recorder.setUser(userData); //crashlyticse user melumatlarini gonderir
      await _prefs.persistUser(user: result?.data);
      await _prefs.persistIsGuest(false);
      await _prefs.persistIsLoggedIn(true);
    });

    bbbb("ukki: " + userData.toString());
  }

  Future<void> serverControl(StatusDynamic? result, Function isSuccess) async {
    if (result != null) {
      if ((result.statusCode)! >= 500) {
        emit(AuthenticationServerError());
        goOn = false;
        return;
      } else if ((result.statusCode)! >= 300) {
        emit(AuthenticationError());
        goOn = false;
        return;
      } else {
        //hec bir xeta olmadigi hall
        isSuccess.call();
        //goOn true olanda novbeti state kecir
        goOn = true;
        return;
      }
    }
  }

  Future<void> delay(bool showSplash) async {
    if (showSplash) await Future.delayed(Duration(seconds: 4));
  }

  // Future<void> configGuest(BuildContext context) async {
  //   if (_prefs.customerGuid != null) {
  //     goOn = true;
  //   } else {
  //     final result = await AuthProvider.getGuidId();
  //     serverControl(result, () {
  //       _prefs.persistCustomerGuid(customerGuid: result.result);
  //       _prefs.persistIsGuest(true);
  //     });
  //   }
  // }

  void logOut(BuildContext context) async {
    bbbb('ddd');

    emit(AuthenticationLoading());

    await _prefs.persistIsLoggedIn(false);
    //final logOutRes =
    final cleaned = await _prefs.clear();

    eeee("ppp: " + _prefs.isLoggedIn.toString());
    eeee("cleanded: " + cleaned.toString());
    PaintingBinding.instance!.imageCache!.clear();

    imageCache!.clear();
    //startApp(context);
    Go.andRemove(context, Pager.login);
    emit(AuthenticationUninitialized());
  }
}
