import 'package:caspa_v2/infrastructure/cubits/category/category_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/category/category_state.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/presentation/page/report_page/widgets/field_loading.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFields extends StatelessWidget {
  const CategoryFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CategoryCubit()..fetch(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          List<Category>? categories;
          if (state is CategorySuccess) {
            categories = state.categories;
          }
          return Column(
            children: [
              StreamBuilder(
                  stream: BlocProvider.of<ReportCubit>(context)
                      .selectedCategoryStream,
                  builder: (contextP, snapShoot) {
                    return CaspaField(
                      readOnly: true,
                      suffixIcon: FieldLoading(state),
                      hint: MyText.tapForselectCategory,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: (BlocProvider.of<ReportCubit>(context)
                                      .selectedCategory
                                      .valueOrNull
                                      ?.name) ??
                                  '')),
                      title: MyText.category,
                      onTap: () => categories != null
                          ? showSheet(context, categories)
                          : Snack.display(
                              context: context,
                              message: MyText.none_category_is_found),
                    );
                  }),
              StreamBuilder(
                  stream: BlocProvider.of<ReportCubit>(context)
                      .selectedSubCategoryStream,
                  builder: (contextP, snapShoot) {
                    return CaspaField(
                      readOnly: true,
                      suffixIcon: FieldLoading(state),
                      hint: MyText.tapForselectCategory,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: (BlocProvider.of<ReportCubit>(context)
                                      .selectedSubCategory
                                      .valueOrNull
                                      ?.name) ??
                                  '')),
                      title: MyText.sub_category,
                      onTap: () => showSheetSub(context, categories),
                    );
                  }),
            ],
          );
          // if (state is CategorySuccess) {
          //   List<Category> categories = state.categories;
          //   final sH = MediaQuery.of(context).size.height - 56 - 90;
          //   final listHeight = categories.length * 35.0;
          //
          //   return
          // } else if (state is CategoryInProgress) {
          //   return CaspaLoading(h: 100,);
          // } else {
          //   return Container();
          // }
        },
      ),
    );
  }

  showSheet(BuildContext context, List<Category>? categoriesList) {
    // categories != null
    //     ? showSheet(context, categories)
    //     : Snack.display(context: context,message: MyText.none_category_is_found),
    if (categoriesList != null && categoriesList.length != 0) {
      List<Category> categories = categoriesList;
      final sH = MediaQuery.of(context).size.height - 56 - 90;
      final listHeight = categories.length * 35.0;

      Sheet.display(
          context: context,
          child: SizedBox(
            //height: 100,
            height: listHeight > sH ? sH : listHeight,
            child: StreamBuilder(
                stream: BlocProvider.of<ReportCubit>(context)
                    .selectedCategoryStream,
                builder: (contextP, snapShoot) {
                  return ListView.builder(
                      physics: Physics.alwaysBounce,
                      shrinkWrap: false,
                      itemCount: categories.length,
                      itemBuilder: (contextK, index) {
                        Category category = categories[index];

                        return CaspaRadio(
                          onTap: () {
                            BlocProvider.of<ReportCubit>(context)
                                .updateSelectedCategory(category);
                          },
                          title: category.name,
//isActive: false,
                          isActive: BlocProvider.of<ReportCubit>(context)
                                  .selectedCategory
                                  .valueOrNull
                                  ?.id ==
                              category.id,
                        );
                      });
                }),
          ));
    } else {
      Snack.display(context: context, message: MyText.none_category_is_found);
    }
  }

  showSheetSub(BuildContext context, List<Category>? categoriesList) {
    Category? selectedCategory =
        BlocProvider.of<ReportCubit>(context).selectedCategory.valueOrNull;

    if (selectedCategory == null) {
      Snack.display(
          context: context, message: MyText.first_select_main_category);
      return;
    } else if (selectedCategory.children != null &&
        selectedCategory.children!.isNotEmpty) {
      List<SubCategory> subCategories = (selectedCategory.children)!;
      final sH = MediaQuery.of(context).size.height - 56 - 90;
      final listHeight = subCategories.length * 35.0;

      Sheet.display(
          context: context,
          child: SizedBox(
            //height: 100,
            height: listHeight > sH ? sH : listHeight,
            child: StreamBuilder(
                stream: BlocProvider.of<ReportCubit>(context)
                    .selectedSubCategoryStream,
                builder: (contextP, snapShoot) {
                  return ListView.builder(
                      physics: Physics.alwaysBounce,
                      shrinkWrap: false,
                      itemCount: subCategories.length,
                      itemBuilder: (contextK, index) {
                        SubCategory category = subCategories[index];

                        return CaspaRadio(
                          onTap: () {
                            BlocProvider.of<ReportCubit>(context)
                                .updateSelectedSubCategory(category);
                          },
                          title: category.name,
//isActive: false,
                          isActive: BlocProvider.of<ReportCubit>(context)
                                  .selectedSubCategory
                                  .valueOrNull
                                  ?.id ==
                              category.id,
                        );
                      });
                }),
          ));
    } else {
      //List<Category> categories = categoriesList!;

      Snack.display(context: context, message: MyText.none_category_is_found);
    }
  }
}
