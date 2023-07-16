import 'package:caspa_v2/infrastructure/cubits/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/widget/general/app_radio.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../infrastructure/cubits/register/register_cubit.dart';

class IdSerieFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  IdSerieFieldRegister({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width / 1.5) -
          60,
      child: StreamBuilder<String>(
        stream: BlocProvider.of<RegisterCubit>(context).serieType,
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
            // controller: controller,
            controller: TextEditingController.fromValue(TextEditingValue(
                text: (BlocProvider.of<RegisterCubit>(context)
                        .serieType
                        .valueOrNull) ??
                    '')),
            onTap: () => Sheet.display(
              context: context,
              child: SizedBox(
                //height: 100,
                height: 160.h,
                child: StreamBuilder(
                  stream: BlocProvider.of<RegisterCubit>(context).serieType,
                  builder: (contextP, snapShoot) {
                    return ListView(
                      children: [
                        AppRadio(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .updatepriceType(MyText.aa);
                          },
                          title: MyText.aa,
                          //  isActive: false,
                          isActive: BlocProvider.of<RegisterCubit>(context)
                                  .serieType
                                  .valueOrNull ==
                              MyText.aa,
                        ),
                        AppRadio(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .updatepriceType(MyText.aze);
                          },
                          title: MyText.aze,
                          //   isActive: false,
                          isActive: BlocProvider.of<RegisterCubit>(context)
                                  .serieType
                                  .valueOrNull ==
                              MyText.aze,
                        ),
                        
                        AppRadio(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .updatepriceType(MyText.myi);
                          },
                          title: MyText.myi,
                          //   isActive: false,
                          isActive: BlocProvider.of<RegisterCubit>(context)
                                  .serieType
                                  .valueOrNull ==
                              MyText.myi,
                        ),
                        AppRadio(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .updatepriceType(MyText.dyi);
                          },
                          title: MyText.dyi,
                          //   isActive: false,
                          isActive: BlocProvider.of<RegisterCubit>(context)
                                  .serieType
                                  .valueOrNull ==
                              MyText.dyi,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            onChanged: (value) =>
                BlocProvider.of<RegisterCubit>(context).updatepriceType(value),
          );
        },
      ),
    );
  }
}
