import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'infrastructure/configs/init.dart';


void main() {
  init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(App());
}

