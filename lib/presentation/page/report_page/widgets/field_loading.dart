import 'package:caspa_v2/infrastructure/cubits/category/category_state.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';

class FieldLoading extends StatelessWidget {
final CategoryState? state;


FieldLoading(this.state);

  @override
  Widget build(BuildContext context) {
    return (state is CategoryInProgress)
        ? CaspaLoading(
      s: 12,
      color: MyColors.grey165,
    )
        : Container();
  }
}
