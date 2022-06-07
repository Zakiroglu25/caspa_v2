import 'package:caspa_v2/infrastructure/cubits/contact/contact_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/contact/contact_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/contact_model.dart';
import 'package:caspa_v2/presentation/page/map_page/map_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'widgets/social_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        centerTitle: true,
        contextA: context,
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
              final Contacts contact = state.contact;
              return ListView(
                padding: Paddings.paddingH16,
                children: [
                  Text(
                    MyText.applyToCustomerService,
                    style: UITextStyle.tW400BigBlack,
                  ),
                  MySizedBox.h32,

                  ///bu kohne versiyadi umid edirem ishleyecekdir
                  // onTap: () => launch(
                  //     'https://wa.me/${contact.whatsapp}?text=${MyText.whatsappMessage}'),
                  SocialItem(
                    name: MyText.whatsapp,
                    path: Assets.svgWhatsapp,
                    onTap: () => launch(
                        'https://api.whatsapp.com/send?phone=${contact.whatsapp}'),
                  ),
                  MySizedBox.h16,
                  // SocialItem(
                  //   name: MyText.telegram,
                  //   path: Assets.svgTelegram,
                  //   onTap: () => launch(contact.whatsapp!),
                  // ),
                  // MySizedBox.h16,
                  SocialItem(
                    name: MyText.facebook,
                    path: Assets.svgMessenger,
                    onTap: () => launch(contact.facebook!),
                  ),
                  MySizedBox.h16,
                  SocialItem(
                    name: MyText.instagram,
                    path: Assets.pngInstagram,
                    isPng: true,
                    onTap: () => launch(contact.instagram!),
                  ),
                  MySizedBox.h16,
                  SocialItem(
                    name: "Xəritədən bax",
                    isPng: false,
                    path: Assets.svgMapPin,
                    onTap: () => Go.to(context, MapPage()),
                  ),
                  MySizedBox.h16,
                  SocialItem(
                    name: MyText.c1453,
                    content: MyText.hot_contact,
                    path: Assets.svgContact,
                    onTap: () => StringOperations.launchCaller(MyText.c1453),
                  ),
                  MySizedBox.h16,
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
