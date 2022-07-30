import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteFieldReport extends StatelessWidget {
  final TextEditingController? controller;

  const NoteFieldReport({Key? key, this.controller})
      : super(key: key); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '')
      BlocProvider.of<ReportCubit>(context).updateNote(controller!.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<ReportCubit>(context).noteStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.note,
          maxLines: 1,
          hint: MyText.note,
          upperCase: true,
          textInputType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<ReportCubit>(context).updateNote(value),
        );
      },
    );
  }
}
