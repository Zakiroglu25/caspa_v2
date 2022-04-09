import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../../infrastructure/models/local/my_user.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/physics.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/string_operations.dart';
import '../../../../util/screen/fade_edge.dart';
import '../../../../widget/general/list_or_empty.dart';
import 'notification_date.dart';
import 'notification_element.dart';

class NotificationGroupedList extends StatelessWidget {
  const NotificationGroupedList({Key? key, required this.notificationList})
      : super(key: key);
  final List<MyNotification> notificationList;
  @override
  Widget build(BuildContext context) {
    return FadeEdge(
      child: ListOrEmpty(
        list: notificationList,
        child: FadeInUp(
          child: Padding(
            padding: Paddings.paddingH16,
            child: GroupedListView<MyNotification, String>(
              physics: Physics.alwaysBounce,
              elements: notificationList,
              padding: Paddings.paddingB116 + Paddings.paddingT4,
              groupBy: (element) => StringOperations.dateConvertFromString(
                  element.createdAt!,
                  smartDay: false),
              groupComparator: (item1, item2) {
                return StringOperations.formattedStringToDatetime(item1)
                    .compareTo(
                        StringOperations.formattedStringToDatetime(item2));
              },
              groupSeparatorBuilder: (String groupByValue) => NotificationDate(
                date: groupByValue,
              ),
              separator: MySizedBox.h10,
              itemBuilder: (context, MyNotification element) =>
                  NotificationElement(
                notification: element,
                onXTap: () {},
              ),
              itemComparator: (item1, item2) {
                return StringOperations.dateConvertFromString(item1.createdAt!,
                        smartDay: false)
                    .compareTo(StringOperations.dateConvertFromString(
                        item2.createdAt!,
                        smartDay: false));
              }, // optional
              useStickyGroupSeparators: false, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.DESC, // optional
            ),
          ),
        ),
      ),
    );
  }
}
