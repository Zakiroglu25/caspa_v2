import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerFieldReport extends StatelessWidget {
  final TextEditingController? controller;

  SellerFieldReport({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '')
      BlocProvider.of<ReportCubit>(context).updateSeller(controller!.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<ReportCubit>(context).sellerStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.seller,
          maxLines: 1,
          hint: MyText.seller,
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<ReportCubit>(context).updateSeller(value),
        );
      },
    );
  }
}
