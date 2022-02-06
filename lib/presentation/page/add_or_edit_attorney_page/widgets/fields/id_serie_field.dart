import 'package:caspa_v2/infrastructure/cubits/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IdSerieFieldAddAttorney extends StatelessWidget {
  final TextEditingController? controller;

  IdSerieFieldAddAttorney({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width / 1.5) -
          60,
      child: StreamBuilder<String>(
        stream: BlocProvider.of<AddAttorneysCubit>(context).serieType,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.serie,
            maxLines: 1,
            hint: MyText.serie,
            upperCase: true,
            readOnly: true,
            textInputType: TextInputType.phone,
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            //  controller: controller,
            controller: TextEditingController.fromValue(TextEditingValue(
                text: (BlocProvider.of<AddAttorneysCubit>(context)
                        .serieType
                        .valueOrNull) ??
                    '')),
            onTap: () => Sheet.display(
                context: context,
                child: SizedBox(
                  //height: 100,
                  height: 70,
                  child: StreamBuilder(
                      stream:
                          BlocProvider.of<AddAttorneysCubit>(context).serieType,
                      builder: (contextP, snapShoot) {
                        return ListView(
                          children: [
                            CaspaRadio(
                              onTap: () {
                                BlocProvider.of<AddAttorneysCubit>(context)
                                    .updatepriceType(MyText.aa);
                              },
                              title: MyText.aa,
                              //  isActive: false,
                              isActive:
                                  BlocProvider.of<AddAttorneysCubit>(context)
                                          .serieType
                                          .valueOrNull ==
                                      MyText.aa,
                            ),
                            CaspaRadio(
                              onTap: () {
                                BlocProvider.of<AddAttorneysCubit>(context)
                                    .updatepriceType(MyText.aze);
                              },
                              title: MyText.aze,
                              //   isActive: false,
                              isActive:
                                  BlocProvider.of<AddAttorneysCubit>(context)
                                          .serieType
                                          .valueOrNull ==
                                      MyText.aze,
                            ),
                          ],
                        );
                      }),
                )),
            onChanged: (value) => BlocProvider.of<AddAttorneysCubit>(context)
                .updatepriceType(value),
          );
        },
      ),
    );
  }
}
