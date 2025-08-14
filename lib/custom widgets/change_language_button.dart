
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      print(context.locale.countryCode);
      if (context.locale.languageCode == "en") {
        context.setLocale(Locale("ar"));
      } else {
        context.setLocale(Locale("en"));
      }
    }, icon: Icon(Icons.language),color: AppColor.grey,);
  }
}
