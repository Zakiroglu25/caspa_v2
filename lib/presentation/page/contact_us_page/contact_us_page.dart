import 'package:caspa_v2/infrastructure/cubits/contact/contact_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/contact/contact_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/contact_model.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/social_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        centerTitle: true,
        title: '',
        //MyText.contact,
        user: false,
        notification: false,
      ),
      body: BlocProvider(
        create: (context) => ContactCubit()..fetch(),
        child: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, state) {
            if (state is ContactSuccess) {
              final Contact? contact = state.contact;
              return ListView(
                padding: Paddings.paddingH16,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      MyText.applyToCustomerService,
                      style: UITextStyle.tW400BigBlack,
                    ),
                  ),
                  MySizedBox.h32,
                  SocialItem(
                    name: MyText.whatsapp,
                    path: Assets.svgWhatsapp,
                    onTap: () {
                      ///bunun launch ede bilmedim
                      launch("${contact!.whatsapp}");
                    },
                  ),
                  MySizedBox.h16,
                  SocialItem(
                    name: MyText.telegram,
                    path: Assets.svgTelegram,
                    onTap: () {},
                  ),
                  MySizedBox.h16,
                  SocialItem(
                    name: MyText.messenger,
                    path: Assets.svgMessenger,
                    onTap: () {},
                  ),
                  MySizedBox.h16,
                  SocialItem(
                    name: MyText.c1453,
                    content: MyText.hot_contact,
                    path: Assets.svgContact,
                    onTap: () => StringOperations.launchCaller(MyText.c1453),
                  ),
                ],
              );
            } else if (state is ContactInProgress) {
              return CaspaLoading();
            } else if (state is ContactError) {
              return EmptyWidget(
                text: state.error,
              );
            } else {
              return EmptyWidget();
            }
          },
        ),
      ),
    );
  }
}
