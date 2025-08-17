import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:ecommercefinalproj/custom%20widgets/custom_text.dart';
import 'package:ecommercefinalproj/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../cubit/favorite/favorite_cubit.dart';
import '../cubit/favorite/favorite_state.dart';
import '../custom widgets/change_language_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          buildIconButtonWidget(context)
        ],
        title: CustomText(text: "my_favorites".tr(), color: AppColor.white, size: 25),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.black,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.4,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: Image.asset(
                "assets/Products/login.png",
                colorBlendMode: BlendMode.exclusion,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              return state.favoriteList.isEmpty
                  ? CustomText(

                    text: "my_favorites".tr(),
                    color: AppColor.black,
                    size: 50,
                  )
                  : ListView.builder(
                      itemCount: state.favoriteList.length,
                      itemBuilder: (context, index) {
                        var newList = state.favoriteList;
                        final item = state.favoriteList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Image.asset(item.image, height: 15.h),
                                CustomText(
                                  text: item.name,
                                  color: AppColor.black,
                                  size: 20,
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    context.read<FavoriteCubit>().toggle(item);
                                  },
                                  icon: newList.contains(item)
                                      ? Icon(
                                          CupertinoIcons.heart_fill,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          CupertinoIcons.heart,
                                          color: AppColor.white,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
              // if (state is FavoriteInitialState) {
              //   return Center(
              //     child: CustomText(
              //       text: "Empty Favorite",
              //       color: AppColor.black,
              //       size: 50,
              //     ),
              //   );
              // } else if (state is FavoriteUpdateState){
              //   return ListView.builder(
              //     itemCount: state.favoriteList.length,
              //     itemBuilder: (context, index) {
              //       var newList =state.favoriteList;
              //       final item = state.favoriteList[index];
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             color: AppColor.lightGrey,
              //             border: Border.all(color: Colors.black),
              //           ),
              //           child: Row(
              //             children: [
              //               Image.asset(item.image, height: 15.h),
              //               CustomText(
              //                 text: item.name,
              //                 color: AppColor.black,
              //                 size: 20,
              //               ),
              //               Spacer(),
              //               IconButton(
              //                 onPressed: () {
              //                   context.read<FavoriteCubit>().toggle(item);
              //                 },
              //                 icon: newList.contains(item)
              //                     ? Icon(
              //                         CupertinoIcons.heart_fill,
              //                         color: Colors.red,
              //                       )
              //                     : Icon(
              //                         CupertinoIcons.heart,
              //                         color: AppColor.white,
              //                       ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   );
              // }
              // else {
              //   return SizedBox();
              // }
            },
          ),
        ],
      ),
    );
  }
}
