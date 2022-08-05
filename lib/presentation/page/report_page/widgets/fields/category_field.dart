import 'dart:math';
import 'package:caspa_v2/infrastructure/cubits/category/category_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/category/category_state.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/presentation/page/report_page/widgets/field_loading.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_filter_field.dart';

class CategoryFields extends StatelessWidget {
  CategoryFields(
      {Key? key, this.selectedMainCategoryId, this.selectedSubCategoryId})
      : super(key: key);
  int? selectedMainCategoryId;
  int? selectedSubCategoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CategoryCubit()..fetch(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          List<Category>? categories;
          if (state is CategorySuccess) {
            categories = state.categories;
            context.read<ReportCubit>().updateCategoriesList(categories);
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
      final listHeight = categories.length * 36.0;

      Sheet.display(
          context: context,
          child: StreamBuilder<List<Category>>(
              stream:
                  BlocProvider.of<ReportCubit>(context).categoriesListStream,
              builder: (contextZ, listSnapshot) {
                List<Category> categories = (listSnapshot.data ?? []);
                final itemCount = categories.length;
                final sH = MediaQuery.of(context).size.height - 56 - 90;
                final listHeight = (itemCount) * 50.0 + 75;
                // final listHeight = (itemCount) * 50.0;
                return SizedBox(
                  height: min(listHeight, sH),
                  child: ListView(
                    physics: Physics.never,
                    shrinkWrap: true,
                    children: [
                      CategoryFilterField(
                        onChanged: (text) => context
                            .read<ReportCubit>()
                            .filterCategoriesList(text),
                        controller: BlocProvider.of<ReportCubit>(context)
                            .categoryFilterController,
                      ),
                      StreamBuilder(
                          stream: BlocProvider.of<ReportCubit>(context)
                              .selectedCategoryStream,
                          builder: (contextP, snapShoot) {
                            return categories.isEmpty
                                ? CaspaLoading()
                                : SizedBox(
                                    //height: min(listHeight, sH),
                                    height: min(listHeight - 75, sH - 75),
                                    child: ListView.builder(
                                        physics: Physics.alwaysBounce,
                                        shrinkWrap: false,
                                        itemCount: categories.length,
                                        itemBuilder: (contextK, index) {
                                          Category category = categories[index];

                                          return CaspaRadio(
                                            onTap: () {
                                              BlocProvider.of<ReportCubit>(
                                                      context)
                                                  .updateSelectedCategory(
                                                      category);
                                              Go.pop(context);
                                            },
                                            title: category.name,
                                            isActive:
                                                BlocProvider.of<ReportCubit>(
                                                            context)
                                                        .selectedCategory
                                                        .valueOrNull
                                                        ?.id ==
                                                    category.id,
                                          );
                                        }),
                                  );
                          }),
                    ],
                  ),
                );
              }));
    } else {
      Snack.display(context: context, message: MyText.none_category_is_found);
    }
  }

  // filter ucun her 2 listviewin ustundeki sized box duzeldilmeli
  //listHeight ve min(listHeight , sH - 75) bura aiddir
  // birinci listviewde filed commentden cixarilmalidir

  showSheetSub(BuildContext context, List<Category>? categoriesList) {
    Category? selectedCategory =
        BlocProvider.of<ReportCubit>(context).selectedCategory.valueOrNull;

    if (selectedCategory == null) {
      Snack.display(
          context: context, message: MyText.first_select_main_category);
      return;
    } else if (selectedCategory.children != null &&
        selectedCategory.children!.isNotEmpty) {
      Sheet.display(
          context: context,
          child: StreamBuilder<List<SubCategory>>(
              stream:
                  BlocProvider.of<ReportCubit>(context).subCategoriesListStream,
              builder: (contextZ, listSnapshot) {
                List<SubCategory> subCategories = (listSnapshot.data ?? []);
                final itemCount = subCategories.length;
                final sH = MediaQuery.of(context).size.height - 56 - 90;
                final listHeight = (itemCount) * 50.0 + 75;
                //final listHeight = (itemCount) * 50.0;
                return SizedBox(
                  height: min(listHeight, sH),
                  child: ListView(
                    physics: Physics.never,
                    shrinkWrap: true,
                    children: [
                      CategoryFilterField(
                        onChanged: (text) => context
                            .read<ReportCubit>()
                            .filterSubCategoriesList(text),
                        controller: BlocProvider.of<ReportCubit>(context)
                            .subCategoryFilterController,
                      ),
                      StreamBuilder(
                          stream: BlocProvider.of<ReportCubit>(context)
                              .selectedSubCategoryStream,
                          builder: (contextP, snapShoot) {
                            return subCategories.isEmpty
                                ? CaspaLoading()
                                : SizedBox(
                                    height: min(listHeight - 75, sH - 75),
                                    //height: min(listHeight, sH),
                                    child: ListView.builder(
                                        physics: Physics.alwaysBounce,
                                        shrinkWrap: true,
                                        itemCount: itemCount,
                                        itemBuilder: (contextK, index) {
                                          SubCategory category =
                                              subCategories[index];

                                          return CaspaRadio(
                                            onTap: () {
                                              BlocProvider.of<ReportCubit>(
                                                      context)
                                                  .updateSelectedSubCategory(
                                                      category);
                                              Go.pop(context);
                                            },
                                            title: category.name,
                                            isActive:
                                                BlocProvider.of<ReportCubit>(
                                                            context)
                                                        .selectedSubCategory
                                                        .valueOrNull
                                                        ?.id ==
                                                    category.id,
                                          );
                                        }),
                                  );
                          }),
                    ],
                  ),
                );
              }));
    } else {
      Snack.display(context: context, message: MyText.none_category_is_found);
    }
  }
}
