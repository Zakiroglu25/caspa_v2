import 'package:caspa_v2/mate_app.dart';
import 'package:flutter/material.dart';
import 'infrastructure/configs/init.dart';

void main() async{
  await init();
  runApp(MateApp());
}
