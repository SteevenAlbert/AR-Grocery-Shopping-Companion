import 'package:flutter/material.dart';

class PropertyCheckbox extends StatefulWidget {
  PropertyCheckbox(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onChanged});

  final String title;
  final bool isSelected;
  final Function onChanged;

  @override
  State<PropertyCheckbox> createState() => _PropertyCheckboxState();
}

class _PropertyCheckboxState extends State<PropertyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 200,
        minWidth: 200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CheckboxListTile(
          value: widget.isSelected,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  color: Theme.of(context).primaryColor, width: 2.0)),
          checkboxShape: CircleBorder(),
          tileColor: widget.isSelected ? Theme.of(context).primaryColor : null,
          activeColor: Theme.of(context).primaryColor,
          title: Text(
            widget.title,
          ),
          onChanged: (((value) {
            widget.onChanged(value);
          })),
        ),
      ),
    );
  }
}
