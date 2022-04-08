import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/notification/notification_state.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/requset/notification_model.dart';
import 'package:caspa_v2/presentation/page/notifications_page/widgets/notification_list_new.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../widget/general/empty_widget.dart';
import 'widgets/notification_element.dart';
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
        contextA: context,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        // buildWhen: (context, state) {
        //   if (state is NotificationRemoveSuccess) {
        //     return false;
        //   } else if (state is NotificationStatusUpdated) {
        //     return false;
        //   }
        //   return true;
        // },
        builder: (context, state) {
          //bbbb("state: $state");
          if (state is NotificationSuccess) {
            bbbb("bnjkhjk; ${state.notificationList}");
            List<MyNotification>? notificationList = state.notificationList;

            return FadeEdge(
              child: notificationsList(notificationList!, context),
              bottomButton: cancelButton(300, context),
            );
          } else if (state is NotificationInProgress) {
            return CaspaLoading();
          } else {
            return EmptyWidget();
          } // if (state is NotificationSuccess) {
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
    );
  }

  ListOrEmpty notificationsList(
      List<MyNotification> result, BuildContext context) {
    return ListOrEmpty(
      list: result,
      child: Padding(
        padding: Paddings.paddingH16,
        child: GroupedListView<MyNotification, String>(
          physics: Physics.alwaysBounce,
          elements: result,
          padding: Paddings.paddingV16 + Paddings.paddingB100,
          groupBy: (element) => StringOperations.dateConvertFromString3(
              element.createdAt!, context),
          groupComparator: (item1, item2) {
            bbbb(
                "-- ${StringOperations.dateConvertFromString5(item1, context)}");
            bbbb(
                "-- ${StringOperations.dateConvertFromString5(item2, context)}");
            bbbb(
                "----- ${StringOperations.dateConvertFromString5(item1, context).compareTo(StringOperations.dateConvertFromString5(item2, context))}");
            return StringOperations.dateConvertFromString5(item1, context)
                .compareTo(
                    StringOperations.dateConvertFromString5(item2, context));
            ;
          },
          groupSeparatorBuilder: (String groupByValue) => Padding(
            padding: Paddings.paddingV8,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                  StringOperations.dateConvertFromString6(
                      groupByValue, context),
                  style: const TextStyle(
                      color: MyColors.grey163, fontWeight: FontWeight.w700)),
            ),
          ),
          separator: MySizedBox.h10,
          itemBuilder: (context, MyNotification element) => NotificationElement(
            notification: element,
            //increase: index % 2 != 0,
            onXTap: () {
              // context.read<NotificationCubit>().removeNotificion(
              //     notificationId: notification.id,
              //     loading: false,
              //     context: context);
              //  context.read<NotificationCubit>().fetch(false);
            },
            // date: "2021-06-10T08:53:19.807",
          ),
          itemComparator: (item1, item2) {
            bbbb(
                "-- ${StringOperations.dateConvertFromString4(item1.createdAt!, context)}");
            bbbb(
                "-- ${StringOperations.dateConvertFromString4(item2.createdAt!, context)}");
            bbbb(
                "----- ${StringOperations.dateConvertFromString4(item1.createdAt!, context).compareTo(StringOperations.dateConvertFromString4(item2.createdAt!, context))}");
            return StringOperations.dateConvertFromString4(
                    item1.createdAt!, context)
                .compareTo(StringOperations.dateConvertFromString4(
                    item2.createdAt!, context));
          }, // optional
          useStickyGroupSeparators: false, // optional
          floatingHeader: true, // optional
          order: GroupedListOrder.DESC, // optional
        ),
      ),
    );
    // return ListOrEmpty(
    //   list: result,
    //   child: NotificationsListNew(
    //     result: result,
    //   ),
    // );
  }

  Positioned cancelButton(double sW, BuildContext context) {
    return Positioned(
      bottom: 40,
      right: sW / 2 - 24,
      child: Container(),
    );
  }
}
