import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/screen/ink_wrapper.dart';

class AddNewAdressButton extends StatelessWidget {
  const AddNewAdressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWrapper(
        onTap: () {
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(),
          // );
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(),
          // );
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Material(
                child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Edit'),
                    leading: Icon(Icons.edit),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: Text('Copy'),
                    leading: Icon(Icons.content_copy),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: Text('Cut'),
                    leading: Icon(Icons.content_cut),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: Text('Move'),
                    leading: Icon(Icons.folder_open),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: Text('Delete'),
                    leading: Icon(Icons.delete),
                    onTap: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            )),
          );
          bbbb("salaaaam");
        },
        child: Container(
            width: 165,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.mainOpacity),
            child: Center(
              child: Text(
                MyText.addNewAdress,
                style:
                    AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
              ),
            )),
      ),
    );
  }
}
