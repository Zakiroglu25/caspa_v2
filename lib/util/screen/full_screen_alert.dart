// Flutter imports:
import 'package:flutter/material.dart';

class FullScreenAlert {
  BuildContext context;

  void _display(Widget widget) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  void hideAlert() => Navigator.of(context, rootNavigator: true).pop();

  Future<void> show(
      {@required Widget? widget,
      Duration duration = const Duration(milliseconds: 300),
      bool? hideAuto,
      Color? backColor}) async {
    _display(IgnorePointer(
        child:
            Material(color: backColor ?? Colors.transparent, child: widget)));
    await Future.delayed(duration);
    if (hideAuto ?? true) hideAlert();
  }

  FullScreenAlert._create(this.context);

  factory FullScreenAlert.of(BuildContext context) {
    return FullScreenAlert._create(context);
  }
}
