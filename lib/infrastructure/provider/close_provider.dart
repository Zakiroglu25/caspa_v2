import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/cupertino.dart';

class CloseProvider with ChangeNotifier {
  int _backCount = 0;

  int get backCount => _backCount;

  set backCount(int value) {
    _backCount = value;
  }

  Future<bool> clickBack() async {
    Future.delayed(Durations.s3).whenComplete(() => backCount = 0);
    backCount++;
    notifyListeners();

    if (backCount > 1) {
      return true;
    }
    Snack.display(
        message: MyText.tapAgainForCloseTheApp, color: MyColors.grey153);
    return false;
  }
}
