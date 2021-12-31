// Flutter imports:
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

typedef OnItemSelected = void Function(List<String> selectedPromoCodeNames);

class GenderBottomSheet extends StatelessWidget {
  final OnItemSelected? onItemSelected;

  final BuildContext? ctx;

  GenderBottomSheet({this.onItemSelected, this.ctx});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [MySizedBox.h5,],
    );
  }

}
