
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class AvailableSize extends StatefulWidget {
  final String size;
  const AvailableSize({super.key, required this.size});

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) =>
     GestureDetector(
       onTap: () {
         setState(() {
           isSelected=!isSelected;
         });
       },
       child: Container(
        margin: EdgeInsets.only(right: 16.0),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected? AppColor.primaryColors:Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColor.primaryColors)
        ),
        child: Text(widget.size,style: TextStyle(
          color: isSelected?  Colors.white:Colors.black,
          fontWeight: FontWeight.bold,
        ),),
           ),
     );

}
