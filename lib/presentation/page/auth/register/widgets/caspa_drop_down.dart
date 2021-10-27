import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final List<ListItem> _dropdownItems = [
    ListItem(1, "Turkiye Anbar"),
    ListItem(2, "Amerika Anbar"),
  ];
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem? _selectedItem;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              color: MyColors.mainGrey,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value as ListItem?;
                    });
                  }),
            ),
          ),
        ),
        // if (widget.errorText != null)
        //   Padding(
        //     padding: EdgeInsets.only(left: 30, top: 10),
        //     child: Text(widget.errorText, style: TextStyle(fontSize: 12, color: Colors.red[800]),),
        //   )
      ],
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
