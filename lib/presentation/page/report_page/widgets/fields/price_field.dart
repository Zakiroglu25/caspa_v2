import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceFieldReport extends StatelessWidget {
  final TextEditingController? controller;

  PriceFieldReport({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReportCubit>(context).updatePrice(controller!.text);
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 1.5) - 10,
      child: StreamBuilder<double>(
        stream: BlocProvider.of<ReportCubit>(context).priceStream,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.price,
            maxLines: 1,
            hint: MyText.price,
            textInputType: const TextInputType.numberWithOptions(signed: true),
            formatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            controller: controller,
            onChanged: (value) =>
                BlocProvider.of<ReportCubit>(context).updatePrice(value),
          );
        },
      ),
    );
  }
}
