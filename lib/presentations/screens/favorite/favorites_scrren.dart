import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

import '../../../providers/favourite_provider/favourite_provider.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  void initState() {
    ref.read(favouriteProvider).fetchAllFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(favouriteProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: AutoSizeText(
          'Favorite',
          style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.isLoadingValue) ...[
              const Center(child: CircularProgressIndicator())
            ] else if (provider.favouriteListValue.isEmpty) ...[
              Center(
                child: Text(
                  'No Favourites Data Available',
                  style: TextStyle(fontSize: 20.sp, color: AppColors.kWhiteColor),
                ),
              )
            ] else ...[
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.favouriteListValue.isEmpty ? 0 : provider.favouriteListValue.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Container(
                        height: 250.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 210.h,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.network(
                                      width: double.infinity,
                                      provider.favouriteListValue[index].imgUrl ?? '',
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 7.h,
                              left: 0, // Position it to the left
                              right: 0, // Position it to the right
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
                                        children: [
                                          AutoSizeText(
                                            provider.favouriteListValue[index].name ?? '',
                                            style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),
                                          ),
                                          AutoSizeText(
                                            '\$${provider.favouriteListValue[index].price}/ day',
                                            style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),
                                          ),
                                        ],
                                      ),
                                      OnProcessButtonWidget(
                                        height: 20.h,
                                        backgroundColor: AppColors.kPrimaryColor,
                                        child: AutoSizeText(
                                          'Book Now',
                                          style: TextStyle(fontSize: 13.sp, color: AppColors.kWhiteColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 15.h,
                                right: 15.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.kWhiteColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: AppColors.kPrimaryColor,
                                    size: 20.r,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
