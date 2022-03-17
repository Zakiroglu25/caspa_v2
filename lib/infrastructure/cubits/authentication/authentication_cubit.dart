import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/services/config_service.dart';
import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/user_operations.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../locator.dart';
import '../../../util/constants/durations.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  HiveService get _prefs => locator<HiveService>();
  ConfigService get _configs => locator<ConfigService>();
  // MyUser? userData = MyUser();
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  bool? goOn; //go on prosesler bitdiyini bildirir ve davam etmeye icaze verir

  void startApp(BuildContext context, {bool showSplash = true}) async {
    if (showSplash) {
      emit(AuthenticationSplash());
    } else {
      emit(AuthenticationLoading());
    }
    try {
      configureFcm(context: context);
      final String? fcm = await _fcm.getToken();
      final bool isLoggedIn = await _prefs.isLoggedIn;
      final String? accessToken = await _prefs.accessToken;

      bbbb("fcm: $fcm");
      bbbb("islog: $isLoggedIn");
      bbbb("accessToken: $accessToken");
      if (isLoggedIn && accessToken != null) {
        //userin girish edib etmemeyi yoxlanilir
        await Future.wait([
          //splah screen ucun min 4 san. gozledilir
          delay(showSplash),
          // eyni zamanda konfiqurasiya edilir
          UserOperations.configUserDataWhenOpenApp(
              accessToken: accessToken, fcm: fcm)
        ]);
        // if (goOn!) {
        emit(AuthenticationAuthenticated());
        //}

      } else {
        bbbb("jjjj: ");
        await Future.wait([
          delay(showSplash),
          // configGuest(context),
        ]);

        //  if (goOn!) {

        if (await _configs.onBoardIsSeen) {
          emit(AuthenticationUninitialized());
        } else {
          emit(AuthenticationOnboarding());
        }

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

  Future<void> configUserData({required accessToken, required fcm}) async {
    final result = await AccountProvider.fetchUserInfo(token: accessToken);
    // print("token: " + accessToken.toString());

    MyUser userData = result?.data;
    //FirestoreDBService.saveUser(userData!);

    try {
      await serverControl(result, () async {
        //sorgu gonderilir ,xeta yaranarsa ve ya serverle bagli sehvlik olarsa
        //server error sehifesini goterir
        Recorder.setUser(userData); //crashlyticse user melumatlarini gonderir
        Recorder.setId(userData.id); //crashlyticse id setted
        Recorder.setUserFCMtoken(fcm); //fcm token setted
        await _prefs.persistUser(user: userData);
        await _prefs.persistIsGuest(false);
        await _prefs.persistIsLoggedIn(true);
      });
    } catch (e, s) {
      bbbb("$e => $s");
    }
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

  void showLogoutDialog(BuildContext context, {bool goWithPager = false}) {
    Alert.show(context, image: SizedBox(
      width:120 ,
        height: 120,
        child: Image.asset(Assets.pngQifil)), cancelButton: true,
        onTap: () {
      logOut(context, goWithPager: goWithPager);
    }, title: MyText.are_u_sure_exit);
  }

  void logOut(BuildContext context, {bool goWithPager = false}) async {
    try {
      //   emit(AuthenticationLoading());
      if (goWithPager) Go.andRemove(context, Pager.login);
      // emit(AuthenticationUninitialized());
      // await _prefs.persistIsLoggedIn(false);
      // //final logOutRes =
      Future.delayed(Durations.s1).then((value) => _prefs.clear());
      // //Hive.box('main').close();
      // PaintingBinding.instance!.imageCache!.clear();
      // imageCache!.clear();
      PaintingBinding.instance!.imageCache!.clear();
      imageCache!.clear();
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
  }

  void onBoardHaveSeen(BuildContext context) async {
    //  emit(AuthenticationLoading());
    await _configs.persistOnBoard(seen: true);
    emit(AuthenticationUninitialized());
  }
}
