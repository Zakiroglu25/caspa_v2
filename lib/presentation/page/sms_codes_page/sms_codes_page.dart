import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/sms_codes/sms_codes_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/sms_codes/sms_codes_state.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/models/remote/response/sms_code_model.dart';
import '../../../widget/main/sms_box/sms_box.dart';

class SmsCodesPage extends StatelessWidget {
  const SmsCodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        contextA: context,
        title: MyText.trendyolSMS,
      ),
      body: ListView(
        padding: Paddings.paddingA16,
        children: [
          SectionName(
            title: MyText.trendyolSMSHowToWork,
          ),
          MySizedBox.h12,
          Text(
            MyText.trendyolSMSHowToWorkText,
            style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
          ),
          Container(
            color: MyColors.mainGrey,
          ),
          //   MySizedBox.h16,
          BlocBuilder<SmsCodesCubit, SmsCodesState>(
            builder: (context, state) {
              if (state is SmsCodesInProgress) {
                return CaspaLoading();
              } else if (state is SmsCodesSuccess) {
                final List<SmsCode> smsList = state.smsList.reversed.toList();

                return ListView.builder(
                  itemCount: smsList.length,
                  shrinkWrap: true,
                  padding: Paddings.paddingV20,
                  physics: Physics.never,
                  itemBuilder: (context, index) {
                    SmsCode currentSms = smsList[index];
                    return SmsBox(
                      code: currentSms.code!,
                      time: currentSms.time!,
                    );
                  },
                );
              } else {
                return EmptyWidget();
              }
            },
          )
        ],
      ),
    );
  }
}
