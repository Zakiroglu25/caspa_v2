import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountFieldReport extends StatelessWidget {
  final TextEditingController ?controller;

  CountFieldReport({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: BlocProvider.of<ReportCubit>(context).productCountStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.product_count,
          maxLines: 1,
          hint: MyText.product_count,
          upperCase: true,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<ReportCubit>(context).updateProductCount(int.parse(value)),
        );
      },
    );
  }
}
