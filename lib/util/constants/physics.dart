import 'package:flutter/material.dart';

class Physics {
  Physics._();


  //all
  static const ScrollPhysics alwaysBounce =
  const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());

  static const ScrollPhysics alwaysClamp =
  const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics());


  static const ScrollPhysics never =
  const NeverScrollableScrollPhysics();

}
