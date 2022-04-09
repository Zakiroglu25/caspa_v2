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
import 'widgets/notification_groupped_list.dart';
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
          if (state is NotificationSuccess) {
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
