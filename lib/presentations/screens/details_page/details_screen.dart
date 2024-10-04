import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> 22ed79f (villa details done and payment implemented)
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/config/routes/app_routes.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/screens/details_page/widgets/expanded_panel.dart';
import 'package:hotel_management/presentations/screens/home/widgets/carosole_for_details.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:hotel_management/providers/current_screen_provider/current_screen_provider.dart';
=======
>>>>>>> 22ed79f (villa details done and payment implemented)
import 'package:hotel_management/providers/product_details_provider/product_details_provider.dart';

class DetailsScreen extends ConsumerStatefulWidget {
<<<<<<< HEAD
  VillaModel model;

  DetailsScreen({super.key, required this.model});
=======
import 'package:hotel_management/providers/product_details_provider/product_details_provider.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
  const DetailsScreen({super.key});
>>>>>>> 22ed79f (villa details done and payment implemented)

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    Future(() {
<<<<<<< HEAD
<<<<<<< HEAD
      ref.read(detailsProvider).fetchVillaDetails(widget.model.id ?? '');
=======
      ref.read(detailsProvider).fetchVillaDetails();
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
      ref.read(detailsProvider).fetchVillaDetails();
>>>>>>> 22ed79f (villa details done and payment implemented)
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailsVilaProvider = ref.watch(detailsProvider);
<<<<<<< HEAD
<<<<<<< HEAD
    final homeProvider = ref.watch(homeScreenProvider);
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
>>>>>>> 22ed79f (villa details done and payment implemented)

    return Scaffold(
      backgroundColor: Colors.black,
      body: detailsVilaProvider.isLoading == true
          ? const Center(child: CircularProgressIndicator())
<<<<<<< HEAD
<<<<<<< HEAD
          : detailsVilaProvider.details == null
              ? const Center(
                  child: Text(
                    "Something wrong!",
                    style: TextStyle(color: AppColors.kWhiteColor),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
=======
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
>>>>>>> 22ed79f (villa details done and payment implemented)
                          children: [
                            const CarosoleforDetails(
                              dotIndicator: false,
                            ),
                            Positioned(
                              top: 25.h,
                              left: 5.w,
                              child: OnProcessButtonWidget(
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
                                borderRadius: BorderRadius.circular(30.r),
                                child: const Icon(Icons.arrow_back),
                                onTap: () {
                                  Navigator.pop(context);
                                  return null;
                                },
                              ),
                            ),
                            Positioned(
                              top: 25.h,
                              right: 5.w,
                              child: OnProcessButtonWidget(
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                                borderRadius: BorderRadius.circular(30.r),
                                child: Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 25.h,
                              right: 25.w,
                              child: OnProcessButtonWidget(
                                backgroundColor: Colors.black,
                                contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                                borderRadius: BorderRadius.circular(30.r),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        2.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              AutoSizeText(detailsVilaProvider.details?.title ?? '', style: TextStyle(fontSize: 20.sp, color: Theme.of(context).primaryColor)),
                              const Spacer(),
                              AutoSizeText(detailsVilaProvider.details?.review ?? '0.0', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor)),
                              5.horizontalSpace,
                              Icon(Icons.star, color: Theme.of(context).primaryColor, size: 14.sp),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        const CustomDividedBar(color: AppColors.kPrimaryColor),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Booking Dates',
                                  style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              15.verticalSpace,
                              Row(
                                children: [
                                  Icon(Icons.calendar_month, color: Theme.of(context).primaryColor),
                                  const Spacer(),
                                  InkWell(
                                      overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                      child: AutoSizeText('Change', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).scaffoldBackgroundColor))),
                                ],
                              )
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        const CustomDividedBar(color: AppColors.kPrimaryColor),

                        ///guest
                        SingleItem(
                          title: 'Max Guests',
                          value: detailsVilaProvider.details?.maxGuest,
                        ),
                        SingleItem(
                          title: 'Adults',
                          value: detailsVilaProvider.details?.adults ?? '2',
                        ),
                        SingleItem(
                          title: 'Children',
                          value: detailsVilaProvider.details?.children ?? '2',
                        ),

                        Text(
                          'Rent Info',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        ///Rent Info
                        SingleItem(
                          title: 'Daily Rent',
                          value: "\$${detailsVilaProvider.details?.dailyRent ?? '\$100'}",
                        ),
                        SingleItem(
                          title: 'Cleaning Fees',
                          value: "\$${detailsVilaProvider.details?.cleaningFees ?? '\$100'}",
                        ),
                        SingleItem(
                          title: 'Service Fees',
                          value: "\$${detailsVilaProvider.details?.serviceFees ?? '\$100'}",
                        ),
                        Text(
                          'Extra',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        SingleItem(
                          title: 'Airport Pickup',
                          value: "\$${detailsVilaProvider.details?.airportPickup ?? '\$100'}",
                        ),
                        SingleItem(
                          title: 'Extra Beds',
                          value: "\$${detailsVilaProvider.details?.extraBeds ?? '\$100'}",
                        ),

                        Text(
                          'Room Info',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        SingleItem(
                          title: 'Bed Rooms',
                          value: detailsVilaProvider.details?.bedRoom ?? '0',
                        ),

                        SingleItem(
                          title: 'Living Rooms',
                          value: detailsVilaProvider.details?.livingRoom ?? '0',
                        ),

                        SingleItem(
                          title: 'Kitchen Rooms',
                          value: detailsVilaProvider.details?.kitchen ?? '0',
                        ),

                        SingleItem(
                          title: 'Bathrooms Rooms',
                          value: detailsVilaProvider.details?.bathroom ?? '0',
                        ),

                        SingleItem(
                          title: 'Gym',
                          value: detailsVilaProvider.details?.gym ?? '0',
                        ),

                        Text(
                          'Top Amenities',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        SingleItem(
                          title: 'Kitchen',
                          value: detailsVilaProvider.details?.amKitchen == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Wifi',
                          value: detailsVilaProvider.details?.amWifi == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Dedicated Workspace',
                          value: detailsVilaProvider.details?.amDedicatedWorkspace == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Free parking on premises',
                          value: detailsVilaProvider.details?.amFreeParking == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Pool',
                          value: detailsVilaProvider.details?.amPool == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Private hot hub',
                          value: detailsVilaProvider.details?.amPrivateHotHub == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Pets Allowed',
                          value: detailsVilaProvider.details?.amPetAllowed == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Tv',
                          value: detailsVilaProvider.details?.amTv == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Washer',
                          value: detailsVilaProvider.details?.amWasher == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Dryer',
                          value: detailsVilaProvider.details?.amDryer == true ? 'Yes' : 'No',
                        ),

                        // ExpandedPanel(),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Cancellation Policy',
                                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 35.w, right: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Free Cancellation',
                                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                                ),
                              ),
                              5.verticalSpace,
                              AutoSizeText(
                                'We offer a complete refund for cancellations made 24 hours prior to the booking time',
                                style: TextStyle(fontSize: 13.sp, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                                wrapWords: true,
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        const CustomDividedBar(color: AppColors.kPrimaryColor),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Description',
                                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 35.w, right: 20.w, bottom: 15.h),
                          child: AutoSizeText(
                            detailsVilaProvider.details?.desc ?? '',
                            style: TextStyle(fontSize: 13.sp, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                            wrapWords: true,
                          ),
                        ),
<<<<<<< HEAD
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                              width: 120,
                              child: AutoSizeText(
                                maxLines: 3,
                                detailsVilaProvider.details?.title ?? '',
                                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: AutoSizeText(
                              "\$${dailyRent ?? '\$0'}",
                              style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: AutoSizeText(
                              "${detailsVilaProvider.dayCount ?? 0}",
                              style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: AutoSizeText(
                                "\$${(detailsVilaProvider.dayCount ?? 0) * int.parse(dailyRent ?? '0')}",
                                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                              width: 120,
                              child: AutoSizeText(
                                maxLines: 3,
                                'Cleaning Fees',
                                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: AutoSizeText(
                              "\$${cleaningFees ?? '\$0'}",
                              style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: AutoSizeText(
                              "${detailsVilaProvider.dayCount ?? 0}",
                              style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: AutoSizeText(
                                "\$${int.parse(cleaningFees ?? '0') * (detailsVilaProvider.dayCount ?? 0)}",
                                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  
                  singleItemFees(context, serviceFees, 'Service Fees',),
                  singleItemFees(context, airportPickup, 'Airport Pickup Fee'),
                  singleItemFees(context, extraBeds, 'Extra Beds Fee'),
                  singleItemFees(context, tax, 'Tax(%)',fromTax: true ),
                  SizedBox(height: 10.h),
                  Divider(height: 1, color: Theme.of(context).primaryColor),
                  SizedBox(height: 10.h),
                  singleItemFees(context, ref.read(detailsProvider).totalAmount.toString(), 'Total'),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: const Text('Close'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        OnProcessButtonWidget(
                          height: 45,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                          borderRadius: BorderRadius.circular(16),
                          child: AutoSizeText('Go to Payment', style: TextStyle(fontSize: 16.sp, color: Theme.of(context).scaffoldBackgroundColor)),
                          onTap: () async {
                            return true;
                          },
                          onDone: (value) {
                            if (value == true) {
                              // log("amount ${detailsVilaProvider.totalAmount()}");
                              Navigator.pushNamed(context, RouteName.paymentScreen, arguments: detailsVilaProvider.details?.id);
                            }
                          },
                        )
=======
                        5.verticalSpace,
>>>>>>> 22ed79f (villa details done and payment implemented)
                      ],
                    ),
                  ),
                ),
                OnProcessButtonWidget(
                  height: 60,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                  borderRadius: BorderRadius.zero,
                  child: AutoSizeText('Continue', style: TextStyle(fontSize: 16.sp, color: Theme.of(context).scaffoldBackgroundColor)),
                  onTap: () async {
                    return true;
                  },
                  onDone: (value) {
                    if (value == true) {
                      Navigator.pushNamed(context, RouteName.paymentScreen);
                    }
                  },
                )
              ],
            ),
    );
  }
<<<<<<< HEAD

  Row singleItemFees(BuildContext context,String? price , String? title, {bool fromTax = false}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AutoSizeText(
        title ?? '',
        style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
      ),
      AutoSizeText(
        fromTax ? price ?? '0' : "\$${price ?? '\$0'}",
        style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
      ),
    ]);
  }
=======
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            const CarosoleforDetails(
                              dotIndicator: false,
                            ),
                            Positioned(
                              top: 25.h,
                              left: 5.w,
                              child: OnProcessButtonWidget(
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
                                borderRadius: BorderRadius.circular(30.r),
                                child: const Icon(Icons.arrow_back),
                                onTap: () {
                                  Navigator.pop(context);
                                  return null;
                                },
                              ),
                            ),
                            Positioned(
                              top: 25.h,
                              right: 5.w,
                              child: OnProcessButtonWidget(
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                                borderRadius: BorderRadius.circular(30.r),
                                child: Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 25.h,
                              right: 25.w,
                              child: OnProcessButtonWidget(
                                backgroundColor: Colors.black,
                                contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                                borderRadius: BorderRadius.circular(30.r),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        2.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              AutoSizeText(detailsVilaProvider.details?.title ?? '', style: TextStyle(fontSize: 20.sp, color: Theme.of(context).primaryColor)),
                              const Spacer(),
                              AutoSizeText(detailsVilaProvider.details?.review ?? '0.0', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor)),
                              5.horizontalSpace,
                              Icon(Icons.star, color: Theme.of(context).primaryColor, size: 14.sp),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        const CustomDividedBar(color: AppColors.kPrimaryColor),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Booking Dates',
                                  style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              15.verticalSpace,
                              Row(
                                children: [
                                  Icon(Icons.calendar_month, color: Theme.of(context).primaryColor),
                                  const Spacer(),
                                  InkWell(
                                      overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                      child: AutoSizeText('Change', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).scaffoldBackgroundColor))),
                                ],
                              )
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        const CustomDividedBar(color: AppColors.kPrimaryColor),

                        ///guest
                        SingleItem(
                          title: 'Max Guests',
                          value: detailsVilaProvider.details?.maxGuest,
                        ),
                        SingleItem(
                          title: 'Adults',
                          value: detailsVilaProvider.details?.adults ?? '2',
                        ),
                        SingleItem(
                          title: 'Children',
                          value: detailsVilaProvider.details?.children ?? '2',
                        ),

                        Text(
                          'Rent Info',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        ///Rent Info
                        SingleItem(
                          title: 'Daily Rent',
                          value: "\$${detailsVilaProvider.details?.dailyRent ?? '\$100'}",
                        ),
                        SingleItem(
                          title: 'Cleaning Fees',
                          value: "\$${detailsVilaProvider.details?.cleaningFees ?? '\$100'}",
                        ),
                        SingleItem(
                          title: 'Service Fees',
                          value: "\$${detailsVilaProvider.details?.serviceFees ?? '\$100'}",
                        ),
                        Text(
                          'Extra',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        SingleItem(
                          title: 'Airport Pickup',
                          value: "\$${detailsVilaProvider.details?.airportPickup ?? '\$100'}",
                        ),
                        SingleItem(
                          title: 'Extra Beds',
                          value: "\$${detailsVilaProvider.details?.extraBeds ?? '\$100'}",
                        ),

                        Text(
                          'Room Info',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        SingleItem(
                          title: 'Bed Rooms',
                          value: detailsVilaProvider.details?.bedRoom ?? '0',
                        ),

                        SingleItem(
                          title: 'Living Rooms',
                          value: detailsVilaProvider.details?.livingRoom ?? '0',
                        ),

                        SingleItem(
                          title: 'Kitchen Rooms',
                          value: detailsVilaProvider.details?.kitchen ?? '0',
                        ),

                        SingleItem(
                          title: 'Bathrooms Rooms',
                          value: detailsVilaProvider.details?.bathroom ?? '0',
                        ),

                        SingleItem(
                          title: 'Gym',
                          value: detailsVilaProvider.details?.gym ?? '0',
                        ),

                        Text(
                          'Top Amenities',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.w, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          height: 2.h,
                          color: Theme.of(context).primaryColor,
                        ),

                        SingleItem(
                          title: 'Kitchen',
                          value: detailsVilaProvider.details?.amKitchen == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Wifi',
                          value: detailsVilaProvider.details?.amWifi == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Dedicated Workspace',
                          value: detailsVilaProvider.details?.amDedicatedWorkspace == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Free parking on premises',
                          value: detailsVilaProvider.details?.amFreeParking == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Pool',
                          value: detailsVilaProvider.details?.amPool == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Private hot hub',
                          value: detailsVilaProvider.details?.amPrivateHotHub == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Pets Allowed',
                          value: detailsVilaProvider.details?.amPetAllowed == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Tv',
                          value: detailsVilaProvider.details?.amTv == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Washer',
                          value: detailsVilaProvider.details?.amWasher == true ? 'Yes' : 'No',
                        ),

                        SingleItem(
                          title: 'Dryer',
                          value: detailsVilaProvider.details?.amDryer == true ? 'Yes' : 'No',
                        ),

                        // ExpandedPanel(),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Cancellation Policy',
                                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 35.w, right: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Free Cancellation',
                                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                                ),
                              ),
                              5.verticalSpace,
                              AutoSizeText(
                                'We offer a complete refund for cancellations made 24 hours prior to the booking time',
                                style: TextStyle(fontSize: 13.sp, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                                wrapWords: true,
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        const CustomDividedBar(color: AppColors.kPrimaryColor),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Description',
                                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 35.w, right: 20.w, bottom: 15.h),
                          child: AutoSizeText(
                            detailsVilaProvider.details?.desc ?? '',
                            style: TextStyle(fontSize: 13.sp, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                            wrapWords: true,
                          ),
                        ),
                        5.verticalSpace,
                      ],
                    ),
                  ),
                ),
                OnProcessButtonWidget(
                  height: 60,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                  borderRadius: BorderRadius.zero,
                  child: AutoSizeText('Continue', style: TextStyle(fontSize: 16.sp, color: Theme.of(context).scaffoldBackgroundColor)),
                  onTap: () async {
                    return true;
                  },
                  onDone: (value) {
                    if (value == true) {
                      Navigator.pushNamed(context, RouteName.paymentScreen);
                    }
                  },
                )
              ],
            ),
    );
  }
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
>>>>>>> 22ed79f (villa details done and payment implemented)
}

class SingleItem extends StatelessWidget {
  final String? title;
  final String? value;

  const SingleItem({
    this.title,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align texts at the start and end
          children: [
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14.w,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Text(
              value ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14.w,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
