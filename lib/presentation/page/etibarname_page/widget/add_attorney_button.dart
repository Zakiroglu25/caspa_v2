import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_attorney_page/add_or_etibarname_page.dart';

class AddAttorneyButton extends StatelessWidget {
  const AddAttorneyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CaspaButton(
      text: MyText.new_attorney,
      onTap: () {
        Go.to(context, Pager.addOrEditAttorney());
      },
    );
  }
}
