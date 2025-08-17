import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommercefinalproj/colors.dart';
import 'package:ecommercefinalproj/cubit/cart/cart_cubit.dart';
import 'package:ecommercefinalproj/cubit/favorite/favorite_cubit.dart';
import 'package:ecommercefinalproj/custom%20widgets/change_language_button.dart';
import 'package:ecommercefinalproj/custom%20widgets/custom_text.dart';
import 'package:ecommercefinalproj/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../cubit/favorite/favorite_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, cartState) {
        bool isAdded = context.read<CartCubit>().isAddedToCart;
        if (isAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColor.darkGrey,

              content: CustomText(
                text: "item_is_added".tr(),
                color: AppColor.white,
                size: 15,
              ),
              duration: Duration(seconds: 1),
            ),
          );
        } else if (isAdded == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColor.darkGrey,
              content: CustomText(
                text: "item_is_removed".tr(),
                color: AppColor.white,
                size: 15,
              ),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, cartState) {
        final favoriteState = context.watch<FavoriteCubit>().state;

        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            actions: [
              buildIconButtonWidget(context),

            ],
            title:
            CustomText(text: "home".tr(), color: AppColor.white, size: 25),
            centerTitle: true,
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
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 16.h,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Column(
                            children: [
                              Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.w),
                                    bottomRight: Radius.circular(15.w),
                                  ),
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 1.h,
                          left: 13.w,
                          child: Container(
                            width: 75.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: AppColor.lightGrey,
                              border: Border.all(color: AppColor.black),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.darkGrey,
                                  blurRadius: 5,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            child: Swiper(
                              itemBuilder: (context, index) {
                                final List<ProductModel> newList =
                                ProductModel.productList.sublist(5);
                                final item = newList[index];
                                return Row(
                                  children: [
                                    Image.asset(item.image),
                                    Column(
                                      children: [
                                        CustomText(
                                          text: "hot_offers".tr(),
                                          color: AppColor.darkGrey,
                                          size: 25,
                                        ),
                                        CustomText(
                                          text: item.name,
                                          color: AppColor.black,
                                          size: 20,
                                        ),
                                        CustomText(
                                          text: "50% OFF",
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              autoplay: true,
                              physics: BouncingScrollPhysics(),
                              fade: 0.1,
                              itemCount: 5,
                              control: SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                  color: AppColor.white,
                                  activeColor: AppColor.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    dividerColor: AppColor.white,
                    dividerHeight: 2,
                    indicatorColor: AppColor.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColor.black,
                    unselectedLabelColor: AppColor.grey,
                    physics: CarouselScrollPhysics(),
                    automaticIndicatorColorAdjustment: true,
                    controller: _tabController,
                    tabs: [
                      Tab(text: "popular".tr()),
                      Tab(text: "latest".tr()),
                      Tab(text: "best_seller".tr()),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 58.h,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: ProductModel.productList.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.5,
                            crossAxisSpacing: 0.2,
                            mainAxisExtent: 25.h,
                          ),
                          itemBuilder: (context, index) {
                            final item = ProductModel.productList[index];
                            return Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          child: Container(width: 40.w)),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width: 40.w,
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.black,
                                            ),
                                            color: AppColor.lightGrey,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 19,
                                        top: -30,
                                        child: Image.asset(
                                          item.image,
                                          height: 20.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: CustomText(
                                          align:
                                          AlignmentDirectional.centerStart,
                                          text: item.name,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context
                                              .read<FavoriteCubit>()
                                              .toggle(item);
                                        },
                                        icon: favoriteState.favoriteList
                                            .contains(item)
                                            ? Icon(
                                          CupertinoIcons.heart_fill,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          CupertinoIcons.heart,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text:
                                        "${item.price}${"LE".tr()}",
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          cartCubit.toggleCart(item);
                                        },
                                        icon: cartState.cartList
                                            .contains(item)
                                            ? Icon(
                                          Icons.remove_shopping_cart,
                                          color: AppColor.black,
                                        )
                                            : Icon(Icons.shopping_cart),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Center(
                          child: CustomText(
                            text: "latest".tr(),
                            color: AppColor.black,
                            size: 50,
                          ),
                        ),
                        Center(
                          child: CustomText(
                            text: "best_seller".tr(),
                            color: AppColor.black,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
