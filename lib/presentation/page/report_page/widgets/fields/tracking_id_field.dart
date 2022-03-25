import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingIdFieldReport extends StatelessWidget {
  final TextEditingController? controller;

  TrackingIdFieldReport({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '')
      BlocProvider.of<ReportCubit>(context).updateTrackingID(controller!.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<ReportCubit>(context).trackingIDStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.tracking_id,
          maxLines: 1,
          hint: MyText.tracking_id,
          upperCase: true,
          textInputType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<ReportCubit>(context).updateTrackingID(value),
        );
      },
    );
  }
}
