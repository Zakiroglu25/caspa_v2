import 'package:flutter/material.dart';

class Physics {
  Physics._();


  //all
  static const ScrollPhysics alwaysBounce =
  const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());

}
