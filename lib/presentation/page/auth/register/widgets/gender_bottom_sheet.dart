// Flutter imports:
import 'package:caspa_v2/presentation/page/auth/register/widgets/selectable/gender_list.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/main/caspa_bottom_sheet/optimal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
