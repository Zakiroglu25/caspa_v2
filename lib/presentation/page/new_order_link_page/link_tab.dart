import 'package:caspa_v2/app.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_state.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/caspa_drop_down.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/widgets/fields/count_field.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/widgets/fields/link_field.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/widgets/fields/local_cargo_field.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/widgets/fields/note_field.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/widgets/fields/price_field.dart';
import 'package:caspa_v2/presentation/page/new_order_payment_page/new_order_payment_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/section_name_and_definition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/commission_zero.dart';
import 'widgets/order_via_link_continue_button.dart';

class OrderViaLinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.newOrder,
        user: false,
        contextA: context,
      ),
      body: BlocListener<OrderViaUrlCubit, OrderViaUrlState>(
        listener: (context, state) {
          if (state is OrderViaUrlSuccess) {
            Go.replace(context, Pager.newOrderPayment);
          }
          else if (state is OrderViaUrlError) {
            Snack.display(context: context,message: state.error);
          }
        },
        child: ListView(
          padding: Paddings.paddingA16,
          children: [
            Text(
              MyText.step + " 1/2",
              style: AppTextStyles.coHead500.copyWith(fontSize: 25),
            ),
            MySizedBox.h16,
            SectionNameAndDefinition(
              imagePath: Assets.linkGirl,
              name: MyText.addProduct,
              definition: MyText.declareText,
            ),
            MySizedBox.h16,
            LinkFieldOrderViaUrl(),
            CountFieldOrderViaUrl(),
            PriceFieldOrderViaUrl(),
            CommissionZero(),
            MySizedBox.h16,
            LocalCargoFieldOrderViaUrl(),
            NoteFieldOrderViaUrl(),
            OrderViaLinkContinueButton(),
            MySizedBox.h32,
          ],
        ),
      ),
    );
  }
}
