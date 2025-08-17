import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';
import '../custom widgets/custom_auth_buttom.dart';
import '../custom widgets/custom_text.dart';
import '../custom widgets/custom_textFormField.dart';
import 'main_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstNameController=TextEditingController();
  final TextEditingController secondNameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            CustomText(
              color: AppColor.white,
              size: 50,
              text: "Serenity",
              align: AlignmentDirectional.center,
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.h),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      CustomText(
                        text: "sign_up".tr(),
                        color: AppColor.black,
                        size: 35,
                      ),
                      SizedBox(height: 7.h),
                      CustomTextFormField(label: "first_name".tr(), textEditingController: firstNameController, icon: null,),
                      SizedBox(height: 1.h),
                      CustomTextFormField(label: "second_name".tr(), textEditingController: secondNameController, icon: null,),
                      SizedBox(height: 1.h),

                      CustomTextFormField(label: "email".tr(), textEditingController: emailController, icon: Icons.email,),
                      SizedBox(height: 1.h),
                      CustomTextFormField(label: "password".tr(), textEditingController: passwordController, icon: Icons.password,),
                      SizedBox(height: 1.h),
                      CustomTextFormField(label: "confirm_password".tr(), textEditingController: confirmPasswordController, icon: Icons.password,),

                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Column(
                                  children: [
                                    SizedBox(height: 30.h),
                                    AlertDialog(
                                      scrollable: false,
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.h),
                                        ),
                                        borderSide: BorderSide(
                                          width: 1,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      backgroundColor: AppColor.white,
                                      title: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: AppColor.black,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColor.white,
                                          size: 45,
                                        ),
                                      ),
                                      elevation: 10,

                                      content: SizedBox(
                                        height: 25.h,
                                        child: Column(
                                          children: [
                                            CustomText(
                                              text: "success_sign".tr(),
                                              color: AppColor.black,
                                              size: 30,
                                            ),
                                            CustomText(
                                              text: "greets".tr(),
                                              color: AppColor.darkGrey,
                                              size: 20,
                                            ),
                                            SizedBox(height: 5.h),
                                            CustomAuthBottom(
                                              screen: MainScreen(),
                                              text: "finish".tr(),
                                              bgColor: AppColor.black,
                                              textColor: AppColor.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      icon: Row(
                                        children: [
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(CupertinoIcons.xmark),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.black,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grey,
                                blurRadius: 50,
                                offset: Offset(3, 2),
                                blurStyle: BlurStyle.inner,
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "sign_up".tr(),
                              style: TextStyle(color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
