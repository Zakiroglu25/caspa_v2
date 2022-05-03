import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/notification/notification_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/general/empty_widget.dart';
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
        listener: (context,state){
          if(state is NotificationRemoveSuccess){
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