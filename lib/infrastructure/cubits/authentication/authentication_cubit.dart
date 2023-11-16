import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/account_provider.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/services/config_service.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/user_operations.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../util/constants/durations.dart';
import '../../services/app_members_service.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  HiveService get _prefs => locator<HiveService>();
  static AppMembersService get _memS => locator<AppMembersService>();
  ConfigService get _configs => locator<ConfigService>();
  // MyUser? userData = MyUser();
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  bool? goOn; //go on prosesler bitdiyini bildirir ve davam etmeye icaze verir

  startApp(BuildContext context,
      {bool showSplash = true, String? token}) async {
    if (showSplash) {
      emit(AuthenticationSplash());
    } else {
      emit(AuthenticationLoading());
    }
    try {
      await Future.delayed(AppDurations.ms500);
      configureFcm(context: context);
      final String? fcm = await _fcm.getToken();
      final bool isLoggedIn = await _prefs.isLoggedIn;
      final String? accessToken = token ?? _prefs.accessToken;

      final appMembers = _memS.appMembers;
      bbbb("fcm: $fcm");
      bbbb("accessToken: $accessToken");

      //burada 3 hal ola biler
      //1- user hal-hazirda girish edib  ,
      //program yeni acilanda ilk "if" ishleyir

      //2- user bir neche profili var birinden logout etdikde
      // "else if" sherti isleyir, yaddashda basqa user varsa ona girish edir

      //3-cu "else" is hec bir halda giris edilmediyi
      // ve ya girish olunmush yegane userden logout edildiyi halda isleyir
      //login sehifesi acilir

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
      } else if (appMembers.isNotEmpty) {
        await Future.wait([
          //splah screen ucun min 4 san. gozledilir
          delay(showSplash),
          // eyni zamanda konfiqurasiya edilir
          UserOperations.configUserDataWhenOpenApp(
              accessToken: appMembers.last.token, fcm: fcm)
        ]);
        // if (goOn!) {
        emit(AuthenticationAuthenticated());
        //}
      } else {
        await Future.wait([
          delay(showSplash),
          // configGuest(context),
        ]);
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
    if (showSplash) await Future.delayed(Duration(seconds: 1));
  }

  void showLogoutDialog(BuildContext context, {bool goWithPager = false}) {
    Alert.show(context,
        image: SizedBox(
            width: 120, height: 120, child: Image.asset(Assets.pngQifil)),
        cancelButton: true, onTap: () {
      logOut(context, goWithPager: goWithPager);
    }, title: MyText.are_u_sure_exit);
  }

  void logOut(BuildContext context, {bool goWithPager = false}) async {
    try {
      //   emit(AuthenticationLoading());

      //user servisinden "logout olunan user"-i silir
      _memS.removeAppMember(_prefs.user);

      //esas HIveServiceni boshaldir
      Future.delayed(AppDurations.ms400).then((value) => _prefs.clear());
      //_prefs.clear();

      //"startApp" mentigini ishledir
      if (goWithPager) Go.andRemove(context, Pager.app(showSplash: true));
      // emit(AuthenticationUninitialized());
      // await _prefs.persistIsLoggedIn(false);
      // //final logOutRes =
      // //Hive.box('main').close();

      PaintingBinding.instance.imageCache.clear();
      imageCache.clear();
      //await startApp(context);
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
