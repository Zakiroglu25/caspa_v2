import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/widget/general/dynamic_sliver_header_delegate.dart';
import 'package:flutter/material.dart';

class ListSliverHandler extends StatelessWidget {
  const ListSliverHandler({Key? key, required this.package}) : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: DynamicSliverHeaderDelegate(
            maxHeight: 24,
            minHeight: 24,
            child: Container(
              color: AppOperations.colorWithId(package.id!),
              child: Container(
                height: 24,
                child: Center(
                  child: Container(
                    width: 33,
                    height: 4,
                    decoration: BoxDecoration(
                        color: MyColors.grey245,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
              ),
            )));
  }
}
