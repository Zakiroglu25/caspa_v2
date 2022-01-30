import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportContiueButton extends StatelessWidget {
  Package? package;

  ReportContiueButton({this.package});

  @override
  Widget build(BuildContext context) {
    return CaspaButton(
      text: MyText.goOn,
      // isButtonActive: () => context.read<ReportCubit>().report(),
      onTap: () => context.read<ReportCubit>().report(context, id: package?.id),
    );
  }
}
