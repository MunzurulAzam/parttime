import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/config/routes/app_routes.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/screens/home/widgets/carosole_slider.dart';
import 'package:hotel_management/presentations/widgets/custom_text_field.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';
import 'package:hotel_management/providers/current_screen_provider/current_screen_provider.dart';

import '../../../core/constants/assets/app_images.dart';

class HomeScreens extends ConsumerStatefulWidget {
  const HomeScreens({super.key});

  @override
  ConsumerState<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends ConsumerState<HomeScreens> {

  @override
  void initState() {

    ref.read(homeScreenProvider).fetchImages();
    ref.read(homeScreenProvider).fetchTopVillas();
    ref.read(homeScreenProvider).fetchAllVillas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeScreenProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        // Added SingleChildScrollView to avoid overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Ensure text aligns properly
          children: [
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CarouselSliderWidget(),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  color: AppColors.kPrimaryColor,
                ),
                child:  CustomTextField(
                  suffixIcon: const Icon(
                    Icons.menu_outlined,
                    color: AppColors.kWhiteColor,
                  ),
                  hint: 'city, airport, or hotel',
                  fillColor: AppColors.kPrimaryColor,
                  color: AppColors.kPrimaryColor,
                  horizontalPadding: 25.w,
                ),
              ),
            ),
            18.verticalSpace,
            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       OnProcessButtonWidget(
            //         onDone: (_) {
            //
            //         },
            //         contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            //         backgroundColor: AppColors.kPrimaryColor,
            //         child: AutoSizeText('Exotic', style: TextStyle(fontSize: 14.sp, color: AppColors.kWhiteColor)),
            //       ),OnProcessButtonWidget(
            //         contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            //         backgroundColor: AppColors.kPrimaryColor,
            //         child: AutoSizeText('Luxury', style: TextStyle(fontSize: 14.sp, color: AppColors.kWhiteColor)),
            //       ),OnProcessButtonWidget(
            //         contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            //         backgroundColor: AppColors.kPrimaryColor,
            //         child: AutoSizeText('Sports', style: TextStyle(fontSize: 14.sp, color: AppColors.kWhiteColor)),
            //       )
            //     ],
            //   ),
            // ),
            18.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Top Five Villa's",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  )),
            ),
            15.verticalSpace,
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeProvider.topVillaList.isEmpty ? 0 : homeProvider.topVillaList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      OnProcessButtonWidget(
                        onDone: (_) {
                          Navigator.pushNamed(context, RouteName.detailsScreen);
                        },
                        backgroundColor: Colors.transparent,
                        width: 130.w,
                        margin: EdgeInsets.only(right: 10.w),
                        contentPadding: EdgeInsets.zero,
                        child: CachedNetworkImage(
                          imageUrl:homeProvider.topVillaList[index].imgUrl ?? '',
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 130.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            width: 130.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              color: AppColors.kDividerColor,
                              image: DecorationImage(
                                image: AssetImage(AppImages.placeholder),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 130.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              color: AppColors.kDividerColor,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30.h,
                        left: 34.w,
                        right: 0,
                        child: AutoSizeText(
                          homeProvider.topVillaList[index].location ?? '',
                          style: TextStyle(fontSize: 18.sp, color: AppColors.kWhiteColor,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            18.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'All Villas',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  )),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: 195.h, // Ensure the container has a defined height
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: homeProvider.allVillaList.isEmpty ? 0 : homeProvider.allVillaList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.detailsScreen,arguments: homeProvider.allVillaList[index]);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h, right: 10.w),
                        child: Container(
                          height: 250.h,
                          width: 270.w, // Give a defined width to avoid layout issues
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 170.h,
                                    width: double.infinity, // Full width
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: CachedNetworkImage(
                                        imageUrl:homeProvider.allVillaList[index].imgUrl ?? '',
                                        fit: BoxFit.cover,
                                        imageBuilder: (context, imageProvider) => Container(
                                          width: 270.w,
                                          height: 250.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Container(
                                          width: 270.w,
                                          height: 250.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                              color: AppColors.kDividerColor,
                                              image: DecorationImage(
                                                image: AssetImage(AppImages.placeholder),
                                                fit: BoxFit.cover,
                                              )
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          width: 270.w,
                                          height: 250.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                            color: AppColors.kDividerColor,
                                          ),
                                        ),
                                      )


                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 5.h,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.kWhiteColor,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              homeProvider.allVillaList[index].name ?? '',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: AppColors.kPrimaryColor,
                                              ),
                                            ),
                                            AutoSizeText(
                                              '\$${homeProvider.allVillaList[index].price} / day',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: AppColors.kPrimaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        OnProcessButtonWidget(
                                          onTap: (){
                                            Navigator.pushNamed(context, RouteName.detailsScreen,arguments: homeProvider.allVillaList[index]);
                                          },
                                          height: 20.h,
                                          backgroundColor: AppColors.kPrimaryColor,
                                          child: AutoSizeText(
                                            'Book Now',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15.h,
                                right: 15.w,
                                child: InkWell(
                                  onTap: (){
                                    homeProvider.addVillaToFavorites(homeProvider.allVillaList[index]);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.kWhiteColor,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Icon(
                                      homeProvider.allVillaList[index].isFavourite == true ? Icons.favorite : Icons.favorite_outline,
                                      color: AppColors.kPrimaryColor,
                                      size: 20.r,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
