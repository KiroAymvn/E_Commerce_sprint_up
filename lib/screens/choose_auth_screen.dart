import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:ecommercefinalproj/screens/signin_screen.dart';
import 'package:ecommercefinalproj/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../custom widgets/custom_auth_buttom.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Products/login.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 125,
            child: Column(
              children: [
                CustomAuthBottom(screen: SigninScreen(), text: 'sign_in'.tr(),),
                SizedBox(height: 3.h,),
                CustomAuthBottom(screen: SignupScreen(), text: "sign_up".tr(),bgColor: AppColor.black,textColor: AppColor.white,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
