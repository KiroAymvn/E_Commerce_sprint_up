import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:ecommercefinalproj/cubit/cart/cart_cubit.dart';
import 'package:ecommercefinalproj/custom%20widgets/change_language_button.dart';
import 'package:ecommercefinalproj/custom%20widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.cartList.isEmpty? SizedBox(): GestureDetector(
            onTap: () {
              buildShowModalBottomSheet(context);
            },
            child: Container (
              width: 30.w,
              height: 25,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                border: Border.all(color: AppColor.black),
                shape: BoxShape.rectangle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(text: "check".tr(), color: AppColor.black, size: 20),
                  Icon(CupertinoIcons.arrow_turn_right_up)
                ],
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        actions: [
          ChangeLanguageButton(),
            BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    return state.cartList.isEmpty? SizedBox(): IconButton(onPressed: (){context.read<CartCubit>().clearList() ; }, icon: CustomText(text: "Clear all", color: AppColor.lightGrey, size: 15));
  },
)
        ],
        title: CustomText(text: "my_cart".tr(), color: AppColor.white, size: 25),
        centerTitle: true,
        backgroundColor: AppColor.black,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final cartList = state.cartList;
          return Stack(
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
              cartList.isEmpty
                  ? Center(
                child: CustomText(
                  text: "no_cart_items".tr(),
                  color: AppColor.black,
                  size: 40,
                ),
              )
                  : ListView.builder(
                itemCount: cartList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = cartList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 15.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.darkGrey,
                                  blurRadius: 10,
                                  offset: Offset(3, 3),
                                ),
                              ],
                              color: AppColor.grey,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 10.h,
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: item.name,
                                        color: AppColor.black,
                                        size: 20,
                                        align: AlignmentDirectional
                                            .centerStart,
                                      ),
                                      CustomText(
                                        text: "${item.price}"+"LE".tr(),
                                        color: Colors.red,
                                        size: 20,
                                        align: AlignmentDirectional
                                            .centerStart,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cartCubit.decrement(item);
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        CustomText(
                                          text: item.quantity.toString(),
                                          color: AppColor.black,
                                          size: 20.sp,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            cartCubit.increment(item);
                                            print(item.name);
                                            print(item.quantity);
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cartCubit.remove(item);
                          },
                          icon: Icon(Icons.delete_rounded),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.lightGrey,
      isDismissible: false,
      // isScrollControlled: true,
      // useSafeArea: true,
      // showDragHandle: true,
      sheetAnimationStyle: AnimationStyle(
        reverseCurve: ElasticInCurve(),
        duration: Duration(milliseconds: 700),
        reverseDuration: Duration(microseconds: 700),
      ),
      constraints: BoxConstraints(maxHeight: 28.h, minHeight: 20.h),
      // enableDrag: true,
      // useRootNavigator: true,
      builder: (context) {
        double discount=0.4;
        var subTotal =context.read<CartCubit>().totalPrice();
        var total=context.read<CartCubit>().totalPriceAfterDiscount(discount);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "choose_voucher".tr(),
                    color: AppColor.black,
                    size: 22,
                  ),
                  CustomText(
                    text: "1 voucher applied ",
                    color: Colors.red,
                    size: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "sub_total".tr(),
                    color: AppColor.black,
                    size: 22,
                  ),
                  CustomText(
                    text: "${context.read<CartCubit>().totalPrice()} LE",
                    color: Colors.red,
                    size: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "discount".tr(),
                    color: AppColor.black,
                    size: 22,
                  ),
                  CustomText(text: "40%", color: Colors.red, size: 20),
                ],
              ),
              Divider(thickness: 1.1, color: AppColor.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "total".tr(),
                    color: AppColor.black,
                    size: 22,
                  ),
                  CustomText(text: "$total "+"LE".tr(), color: Colors.red, size: 20),
                ],
              ),
              SizedBox(height: 2.h),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: AppColor.black
                      ),
                      child: Center(child: CustomText(
                          text: "close".tr(), color: AppColor.white, size: 20),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: AppColor.black
                      ),
                      child: Center(child: CustomText(
                          text: "checkout".tr(), color: AppColor.white, size: 20),),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
