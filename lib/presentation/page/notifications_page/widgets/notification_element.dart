// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/models/local/my_user.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/screen/alert.dart';

class NotificationElement extends StatelessWidget {
  final Function? onXTap;
  final bool? increase;
  final MyNotification notification;

  const NotificationElement({
    Key? key,
    required this.onXTap,
    required this.notification,
    this.increase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.toString()),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.secondRED,
        ),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return Alert.show(
          context,
          title: MyText.are_u_sure_delete,
          buttonText: MyText.yes,
          cancelButton: true,
          onTap: () => context.read<NotificationCubit>().removeNotificion(
              context: context, loading: true, notificationId: notification.id),
          image: SizedBox(
            width: 120.sm,
            height: 120.sm,
            child: Image.asset(Assets.pngSad),
          ),
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: Paddings.paddingA16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 16, color: MyColors.black34),
                  ),
                  MySizedBox.h4,
                  Text(
                    notification.description!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 12, color: MyColors.grey153),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: (notification.read == 0)
                      ? MyColors.grey245
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ],
        ),
      ),
    );
  }
}
