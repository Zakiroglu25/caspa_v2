import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/errorable_image.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';

class PhotoPickment extends StatelessWidget {
  String? url;

  PhotoPickment({this.url});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<File?>(
      stream: BlocProvider.of<ReportCubit>(context).imageStream,
      builder: (context, snapshot) {
        BehaviorSubject<File?> image = context.read<ReportCubit>().image;
        return Align(
          alignment: Alignment.centerLeft,
          child: InkWrapper(
            onTap: () {
              context.read<ReportCubit>().checkAndPickImage(context);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                  width: 120.sp,
                  height: 120.sp,
                  decoration: BoxDecoration(
                    color: MyColors.mainGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: image.hasValue
                      ? Flash(
                          key: Key(image.valueOrNull!.path),
                          child: Image.file(
                            image.valueOrNull!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: WidgetOrEmpty(
                              value: url == null,
                              elseChild: ErrorableImage(
                                url: url,
                                fit: BoxFit.cover,
                                placeHolder: Icon(Icons.camera),
                              ),
                              child: Icon(Icons.camera)),
                        )),
            ),
          ),
        );
      },
    );
  }
}
