import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/notification/notification_state.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/new_empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widget/custom/buttons/caspa_button.dart';
import '../../../widget/general/empty_widget.dart';
import 'widgets/notification_empty_widget.dart';
import 'widgets/notification_groupped_list.dart';

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
      body: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is NotificationRemoveSuccess) {
            context.read<NotificationCubit>().fetch();
          }
        },
        // buildWhen: (context, state) {
        //   if (state is NotificationRemoveSuccess) {
        //     return false;
        //   } else if (state is NotificationStatusUpdated) {
        //     return false;
        //   }
        //   return true;
        // },
        builder: (context, state) {
          if (state is NotificationSuccess) {
            if (state.notificationList.isEmpty) {
              return NotificationEmptyWidget();
            }
            return NotificationGroupedList(
              notificationList: state.notificationList,
            );
          } else if (state is NotificationInProgress) {
            return CaspaLoading();
          } else {
            return EmptyWidget();
          }
        },
      ),
    );
  }
}


