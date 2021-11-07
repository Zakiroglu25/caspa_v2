// Flutter imports:
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

  static pushReplacement(BuildContext context, Widget page) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static to(BuildContext context, Widget page) async {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}