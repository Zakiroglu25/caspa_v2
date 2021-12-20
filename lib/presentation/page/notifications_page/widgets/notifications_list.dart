// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/requset/notification_model.dart';
import 'package:caspa_v2/presentation/page/notifications_page/widgets/notification_element.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationResult>? result;

  NotificationsList({@required this.result});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15),
      itemCount: (result!.length) + 1,
      physics: BouncingScrollPhysics(),
      controller: _controller,
      itemBuilder: (context, index) {
        if (index < result!.length) {
          return Padding(
            padding: Paddings.paddingH16,
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringOperations.dateConvert(
                          result![index].date!, context),
                      style: TextStyle(
                          color: MyColors.grey163, fontWeight: FontWeight.w700),
                    ),
                    MySizedBox.h12,
                    ListView.builder(
                      shrinkWrap: true,
                      //    padding: EdgeInsets.symmetric(vertical: 2),
                      itemCount: result![index].notification!.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, indexZ) {
                        return notificationContainer(
                          context,
                          indexZ,
                          notification: result![index].notification![indexZ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: 100,
          );
        }
      },
    );
  }



  Widget notificationContainer(BuildContext context, int index,
      {NotificationBody? notification}) {
    return FadeInUp(
      duration: Duration(milliseconds: AppOperations.getTime(index)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: NotificationElement(
          title: notification!.title,
          content: notification.text,
          increase: index % 2 != 0,
          onXTap: () {
            context.read<NotificationCubit>().removeNotificion(

              
                notificationId: notification.id,
                loading: false,
                context: context);
            //  context.read<NotificationCubit>().fetch(false);
          },
          // date: "2021-06-10T08:53:19.807",
        ),
      ),
    );
  }
}
