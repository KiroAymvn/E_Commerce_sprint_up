
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class CustomAuthBottom extends StatelessWidget {
  CustomAuthBottom( {this.textColor= AppColor.black,
    this.bgColor=AppColor.white,
    super.key, required this.screen, required this.text,  });
  final Widget screen;
  final String text ;
  Color textColor;
  Color bgColor=AppColor.white;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen,)),
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          color: bgColor ,
          boxShadow: [
            BoxShadow(
              color: textColor,
              blurRadius: 50,
              offset: Offset(3, 2),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Text(text,style: TextStyle(color: textColor),),
        ),
      ),
    );
  }
}
