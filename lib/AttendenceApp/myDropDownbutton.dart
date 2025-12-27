import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class myDropDown extends StatefulWidget {
  final String? selecteditem;
  final List<String> itemsList;
  final String hint;
  final double width;
  final Function(String?)? onChanged; // Add this callback

  myDropDown({
    super.key,
    this.selecteditem,
    required this.itemsList,
    required this.hint,
    required this.width,
    this.onChanged, // Add this parameter
  });

  @override
  State<myDropDown> createState() => _myDropDownState();
}

class _myDropDownState extends State<myDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            spacing: 3,
            children: [
              Icon(Icons.list, size: 16, color: Colors.grey),
              Text(
                widget.hint,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          items: widget.itemsList
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
              .toList(),
          value: widget.selecteditem,
          onChanged: (value) {
            setState(() {
              // Update local state
            });
            // Call parent callback if provided
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          buttonStyleData: ButtonStyleData(
            height: 45,
            width: widget.width,
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
              color: Colors.white,
            ),
            elevation: 2,
          ),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.arrow_drop_down, color: Colors.green),
            iconSize: 16,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            elevation: 4,
            offset: Offset(0, -5),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 14),
          ),
        ),
      ),
    );
  }
}