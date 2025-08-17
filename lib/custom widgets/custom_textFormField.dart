import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/cubit/favorite/favorite_cubit.dart';
import 'package:ecommercefinalproj/cubit/favorite/favorite_state.dart';
import 'package:ecommercefinalproj/cubit/password/password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key, required this.label, required this.icon, required this.textEditingController,
  });

  final TextEditingController textEditingController;
  final String label;

  IconData ?icon;


  @override
  Widget build(BuildContext context) {
    TextInputType? keyBoardType(String label) {
      if (label == "password".tr() || label == "confirm_password".tr()) {
        return TextInputType.visiblePassword;
      }
      else if (label == "email".tr()) {
        return TextInputType.emailAddress;
      }
      else if (label == "first_name" || label == "second_name") {
        return TextInputType.name;
      }
      else {
        return null;
      }
    }
    return BlocBuilder<PasswordCubit, bool>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 45),
          child: TextFormField(

            onSaved: (value) {
              textEditingController.text = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${"enter_your".tr()}$label";
              }
              else if (label == "email".tr()) {
                if (!value.endsWith("@gmail.com")) {
                  return "email_error".tr();
                }
              }
              else if (label == "password".tr()) {
                if (value.length < 6) {
                  return "password_error".tr();
                }
              }
              else {
                return null;
              }
              return null;
            },
            controller: textEditingController,
            showCursor: true,
            keyboardType: keyBoardType(label),
            obscureText: label == "password".tr() ||
                label == "confirm_password".tr() ? !state : state,
            textAlign: TextAlign.center,
            cursorColor: AppColor.black,
            cursorHeight: 30,
            decoration: InputDecoration(
              suffixIcon: label == "password".tr() ||
                  label == "confirm_password".tr()
                  ?   IconButton(onPressed: (){
                    context.read<PasswordCubit>().toggle();
              }, icon:state==false? Icon(CupertinoIcons.eye_slash) : Icon(CupertinoIcons.eye))  :null    ,
              icon: Icon(icon, color: AppColor.darkGrey,),
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
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
