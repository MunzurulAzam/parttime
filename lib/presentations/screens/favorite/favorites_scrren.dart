import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:cached_network_image/cached_network_image.dart';
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
import 'package:cached_network_image/cached_network_image.dart';
>>>>>>> 22ed79f (villa details done and payment implemented)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

<<<<<<< HEAD
<<<<<<< HEAD
import '../../../core/config/routes/app_routes.dart';
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
>>>>>>> 22ed79f (villa details done and payment implemented)
import '../../../core/constants/assets/app_images.dart';
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
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Favourite List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
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
                child: 
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
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
                                    child: CachedNetworkImage(
                                      imageUrl:provider.favouriteListValue[index].imgUrl ?? '',
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) => Container(
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
<<<<<<< HEAD
                                      )
<<<<<<< HEAD


                                    ),
                                  ),
<<<<<<< HEAD
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
=======
>>>>>>> 24dd561 (favourite home page and favourite page functionality done)
                                        OnProcessButtonWidget(
                                          onTap: (){
                                            Navigator.pushNamed(context, RouteName.detailsScreen,arguments: provider.favouriteListValue[index]);

                                          },
                                          height: 20.h,
                                          backgroundColor: AppColors.kPrimaryColor,
                                          child: AutoSizeText(
                                            'Book Now',
                                            style: TextStyle(fontSize: 13.sp, color: AppColors.kWhiteColor),
                                          ),
                                        )
                                      ],
                                    ),
<<<<<<< HEAD
=======
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: CachedNetworkImage(
                                      imageUrl:provider.favouriteListValue[index].imgUrl ?? '',
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) => Container(
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
                                        height: 250.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                          color: AppColors.kDividerColor,
                                        ),
                                      ),
                                    )


>>>>>>> 90d7495 (villa details done and payment implemented)
=======
                                    ],
>>>>>>> 22ed79f (villa details done and payment implemented)
=======
>>>>>>> 24dd561 (favourite home page and favourite page functionality done)
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 15.h,
                                  right: 15.w,
                                  child: InkWell(
                                    onTap: (){
                                      provider.deleteVillaFromFavorites(provider.favouriteListValue[index].id ?? '',context);
                                      provider.fetchAllFavourites();
                                    },
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
                                    ),
                                  ))
                            ],
                          ),
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
