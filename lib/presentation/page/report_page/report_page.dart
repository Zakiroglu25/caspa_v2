import 'package:caspa_v2/infrastructure/cubits/category/category_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/category/category_state.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:caspa_v2/widget/general/section_name_and_definition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widget/general/custom_bottom_sheet.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(title: MyText.report, user: false, contextA: context),
      body: SafeArea(
        child: ListView(
          padding: Paddings.paddingH16,
          children: [
            SectionNameAndDefinition(
              imagePath: Assets.otherBox,
              name: MyText.addProduct,
              definition: MyText.declareText,
            ),
            MySizedBox.h24,
            CaspaField(
              title: "Satıcı",
              hint: "Satıcının adını daxil edin",
            ),
            BlocProvider.value(
              value: CategoryCubit()..fetch(),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  bbbb("state: " + state.toString());

                  if (state is CategorySuccess) {
                    List<Category> categories = state.categories;
                    final sH = MediaQuery.of(context).size.height - 56 - 90;
                    final listHeight = categories.length * 35.0;

                    bbbb("list h: " + listHeight.toString());
                    bbbb("sH : " + sH.toString());

                    return CaspaField(
                      title: MyText.category,
                      hint: MyText.category,

                      onTap: () {
                        Sheet.display(
                            context: context,
                            child: SizedBox(
                              height: listHeight > sH ? sH : listHeight,
                              child: ListView.builder(
                                  physics: Physics.alwaysBounce,
                                  shrinkWrap: false,

                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    Category category = categories[index];

                                    return CaspaRadio(
                                        onTap: () {}, title: category.name,

                                    isActive:  context.read<ReportCubit>().selectedCategory?.id== category.id,
                                    );
                                  }),
                            ));
                      },
                    );
                  } else if (state is CategoryInProgress) {
                    return CaspaLoading();
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            CaspaField(
              title: "Məhsulun sayı",
              hint: "Sayı daxil edin",
            ),
            CaspaField(
              title: "İzləmə kodu",
              hint: "Kodu daxil edin",
            ),
            CaspaField(
              title: "Qeyd",
              hint: "Qeydlərinizi buraya daxil edin",
            ),
            SectionName(title: "Faktura"),
            MySizedBox.h16,
            Container(
              width: 120.sp,
              height: 120.sp,
              decoration: BoxDecoration(
                color: MyColors.mainGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(Icons.camera),
              ),
            ),
            MySizedBox.h12,
            Text(
              MyText.factura,
              style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
            ),
            MySizedBox.h12,
            CaspaButton(
              text: "Fayl əlavə et",
              w: 110.sp,
              h: 44.sp,
              textSize: 14.sp,
            ),
            MySizedBox.h24,
            CaspaButton(text: "Davam et"),
            MySizedBox.h40,
          ],
        ),
      ),
    );
  }
}
