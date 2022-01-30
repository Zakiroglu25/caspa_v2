import 'package:caspa_v2/infrastructure/cubits/commission/comission_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/commission/comission_state.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommissionField extends StatelessWidget {
  const CommissionField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyText.Commission,
          style: AppTextStyles.sanF400Grey,
        ),
        MySizedBox.h4,
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              color: Color.fromRGBO(211, 41, 45, 0.1),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder<CommissionCubit, CommissionState>(
                  builder: (context, state) {
                    if (state is CommissionSuccess) {
                      final commission = state.commission;
                      return Text(
                        "$commission%",
                        style: AppTextStyles.sanF400.copyWith(fontSize: 15),
                      );
                    } else {
                      return CaspaLoading();
                    }
                  },
                )),
          ),
        ),
      ],
    );
  }
}
