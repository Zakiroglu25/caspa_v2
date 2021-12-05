// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/models/local/gender.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/selectable/selectable_element.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/enums/gender_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnItemSelected = void Function(Gender gender);

class GenderList extends StatefulWidget {
  GenderList({
    this.onItemSelected,
    this.controller,
    this.selected,
    required this.contextZ,
  });

  final OnItemSelected? onItemSelected;
  BuildContext? contextZ;
  GenderType? selected;
  TextEditingController? controller;

  @override
  _GenderListState createState() => _GenderListState();
}

class _GenderListState extends State<GenderList> {
  final List<Gender> genderList = [
    Gender(title: "Kişi", value: 'man', type: GenderType.man),
    Gender(title: "Qadın", value: 'woman', type: GenderType.woman),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH20,
      child: DefaultTextStyle(
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final currentGender = genderList[index];
            return gender(context, currentGender);
          },
          itemCount: genderList.length,
        ),
      ),
    );
  }

  SelectableGender gender(BuildContext context, Gender gender) {
    return SelectableGender(
      key: Key("value"),
      gender: gender,
      selectedGenderType: widget.selected,
      onTap: () => _onCategorySelected(gender),
    );
  }

  void _onCategorySelected(Gender gender) {
    if (gender.type == widget.selected) {
      BlocProvider.of<RegisterCubit>(widget.contextZ!).updateGender('');
      setState(() {
        widget.selected = GenderType.unselected;
        widget.controller!.text = '';
      });
    } else {
      BlocProvider.of<RegisterCubit>(widget.contextZ!)
          .updateGender(widget.selected.toString());
      setState(() {
        widget.selected = gender.type!;
        widget.controller!.text = gender.title!;
      });
    }

    widget.onItemSelected!(gender);

    // promoCodeIdController.text = selectedPromoCodes.toString();
  }
}
