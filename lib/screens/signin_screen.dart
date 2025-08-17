import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:ecommercefinalproj/custom%20widgets/custom_auth_buttom.dart';
import 'package:ecommercefinalproj/screens/home_screen.dart';
import 'package:ecommercefinalproj/screens/main_screen.dart';
import 'package:ecommercefinalproj/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../custom widgets/custom_text.dart';
import '../custom widgets/custom_textFormField.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    emailController.dispose();
    passWordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                  height: 500,
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      CustomText(
                        text: "sign_in".tr(),
                        color: AppColor.black,
                        size: 35,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        icon: Icons.email,
                        label: "email".tr(),
                        textEditingController: emailController,
                      ),
                      SizedBox(height: 3.h),
                      CustomTextFormField(
                        icon: Icons.lock,
                        label: "password".tr(),
                        textEditingController: passWordController,
                      ),
                      SizedBox(height: 3.h),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        child: CustomText(
                          text: "forget_password".tr(),
                          color: Colors.red,
                          size: 20,
                          align: AlignmentDirectional.centerStart,
                        ),
                      ),
                      SizedBox(height: 15.h),
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
                              "sign_in".tr(),
                              style: TextStyle(color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "have_account".tr(),
                              color: Colors.black,
                              size: 15,
                            ),
                            CustomText(
                              text: "sign_up".tr(),
                              color: Colors.red,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
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
