import 'dart:io';

import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  PreferencesService get _prefs => locator<PreferencesService>();

  //RenewTokenService get _token => locator<RenewTokenService>();

  bool? goOn;

  void startApp(BuildContext context, {bool showSplash = true}) async {
    aaaa('1');

    if (showSplash) {
      emit(AuthenticationSplash());
    }
    else {
      emit(AuthenticationLoading());
    }
    try {
      aaaa('2');
      configureFcm(context: context);
      final bool isLoggedIn = _prefs.isLoggedIn;
      eeee(isLoggedIn.toString());
      if (isLoggedIn) {
        //userin girish edib etmemeyi yoxlanilir
        aaaa('3');
        await Future.wait([
          //splah screen ucun min 4 san. gozledilir
          delay(showSplash),
          // eyni zamanda konfiqurasiya edilir
          configUserData(context)
        ]);
        // if (goOn!) {
        aaaa('4');
        emit(AuthenticationAuthenticated());
        //}
      } else {
        await Future.wait([
          delay(showSplash),
          // configGuest(context),
        ]);
        aaaa('5');
        //  if (goOn!) {
        emit(AuthenticationUninitialized());
        // }
      }
    } on SocketException catch (_) {
      emit(AuthenticationNetworkError());
    } catch (e) {
      eeee("AuthenticationError: " + e.toString());
      emit(AuthenticationError());
    }
  }

  Future<void> configUserData(BuildContext context) async {
    final result = await AccountProvider.fetchUserInfo(
        token: '201|h4MgubsbiWi39sLDgSbLaHe8LLpGk1J5tWrI1SrR');

    await serverControl(result, () async {
      //sorgu gonderilir ,xeta yaranarsa ve ya serverle bagli sehvlik olarsa
      //server error sehifesini goterir
      await _prefs.persistUser(user: result?.data);
      await _prefs.persistIsGuest(false);
      await _prefs.persistIsLoggedIn(true);
    });
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

    _prefs.persistIsLoggedIn(false);
    final logOutRes = await _prefs.clear();
    //eeee("loooooog: " + logOutRes.toString());
    //eeee("ppp: " + _prefs.user.toString());
    PaintingBinding.instance!.imageCache!.clear();

    imageCache!.clear();
    startApp(context);
    emit(AuthenticationUninitialized());
  }
}
