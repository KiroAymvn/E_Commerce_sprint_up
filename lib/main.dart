import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/cubit/cart/cart_cubit.dart';
import 'package:ecommercefinalproj/cubit/favorite/favorite_cubit.dart';
import 'package:ecommercefinalproj/cubit/password/password_cubit.dart';
import 'package:ecommercefinalproj/screens/choose_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      // EasyLocalization(
      // path: "assets/translations",
      // supportedLocales: [Locale("en"),Locale("ar")],
      // fallbackLocale: Locale("en"),
      // child: MyApp()));
      EasyLocalization(
        supportedLocales: [Locale("en"), Locale("ar")],
        fallbackLocale: Locale("en"),
        path: "assets/translations",
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoriteCubit(),),
        BlocProvider(create: (context) => CartCubit(),),
        BlocProvider(create: (context) => PasswordCubit(),),
      ],
      child: Sizer(

        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: ChooseAuthScreen(),
          );
        },
      ),
    );
  }
}
