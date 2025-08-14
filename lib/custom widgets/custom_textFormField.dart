import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key, required this.label, required this.icon, required this.textEditingController,
  });

  final TextEditingController textEditingController;
  final String label ;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45),
      child: TextFormField(
        validator: (value){
          return null;
        },
        controller: textEditingController,
        showCursor: true,
        textAlign: TextAlign.center,
        cursorColor: AppColor.black,
        cursorHeight: 30,

        decoration: InputDecoration(

          icon: Icon(icon,color: AppColor.darkGrey,),
          hint: Text(
            label,
            style: TextStyle(color: AppColor.darkGrey),
          ),
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          fillColor: AppColor.lightGrey,
          filled: true,
          constraints: BoxConstraints(
            minHeight: 40,
            maxHeight: 60,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 100,
              strokeAlign: 20,
            ),
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
