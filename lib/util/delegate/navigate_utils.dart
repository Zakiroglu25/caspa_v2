// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:

class Go {
  // static pushPage(BuildContext context, Widget page) async {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => MultiBlocProvider(providers: [
  //             BlocProvider.value(value: HeaderCubit()..fetch()),
  //           ], child: page)));
  // }

  Go._();

  static replace(BuildContext context, Widget page) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static pop(BuildContext context) async {
    Navigator.pop(context);
  }

  static to(BuildContext context, Widget page) async {
    Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  static to2(BuildContext context, Widget page) async {
    Navigator.of(context, rootNavigator: false).push(CupertinoPageRoute(
      builder: (context) => page,
    ));
  }

  static andRemove(BuildContext context, Widget page) async {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}
