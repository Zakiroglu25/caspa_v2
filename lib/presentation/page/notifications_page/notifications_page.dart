import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/notification/notification_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/requset/notification_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/notifications_list.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.notifications,
        notification: false,
        user: false,
      ),
      body: BlocProvider(
        create: (context) => NotificationCubit(),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          buildWhen: (context, state) {
            if (state is NotificationRemoveSuccess) {
              return false;
            } else if (state is NotificationStatusUpdated) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            return FadeEdge(
              child: notificationsList(
                [
                  NotificationResult(date: DateTime.now(),
                      notification: [
                        NotificationBody(id: 1, title: "Bağlama: 252442", text: "Xarici anbara bəyan et"),
                        NotificationBody(id: 2, title: "Bağlama: 252442", text: "Xarici anbara bəyan et"),
                        NotificationBody(id: 3, title: "Bağlama: 252442", text: "Xarici anbara bəyan et"),
                        NotificationBody(id: 4, title: "Bağlama: 252442", text: "Xarici anbara bəyan et"),
                        NotificationBody(id: 5, title: "Bağlama: 252442", text: "Xarici anbara bəyan et"),

                      ])
                ],
              ),
              bottomButton: cancelButton(300, context),
            );
            // if (state is NotificationSuccess) {
            //   context.read<NotificationCubit>()
            //     ..updateNotificionStatus();
            //   return FadeEdge(
            //     child: notificationsList(
            //       [
            //         NotificationResult(date: DateTime.now(),
            //             notification: [
            //               NotificationBody(id: 1, text: "salam", title: "aaaa"),
            //               NotificationBody(id: 1, text: "salam", title: "aaaa"),
            //               NotificationBody(id: 1, text: "salam", title: "aaaa"),
            //               NotificationBody(id: 1, text: "salam", title: "aaaa"),
            //               NotificationBody(id: 1, text: "salam", title: "aaaa"),
            //
            //             ])
            //       ],
            //     ),
            //     bottomButton: cancelButton(300, context),
            //   );
            // } else if (state is NotificationInProgress) {
            //   return Center(child: CaspaLoading());
            // } else if (state is NotificationNetworkError) {
            //   return NoData(text: 'network_error');
            // } else if (state is NotificationNotFound) {
            //   return NoData(text: 'there_is_no_result');
            // } else {
            //   return NoData(text: 'there_is_no_result');
            // }
          },
        ),
      ),
    );
  }

  NotificationsList notificationsList(List<NotificationResult> result) {
    return NotificationsList(
      result: result,
    );
  }

  Positioned cancelButton(double sW, BuildContext context) {
    return Positioned(
      bottom: 40,
      right: sW / 2 - 24,
      child: Container(),
    );
  }
}