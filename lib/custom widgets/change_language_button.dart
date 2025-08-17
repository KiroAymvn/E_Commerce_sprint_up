import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

IconButton buildIconButtonWidget(BuildContext context) {
  return IconButton(onPressed: (){
    print("${context.locale.languageCode} ******************");
    if (context.locale.languageCode == "ar") {
      context.setLocale(Locale("en"));
    } else {
      context.setLocale(Locale("ar"));
    }
  }, icon: Icon(Icons.language,),color: AppColor.grey,);
}
