import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  AutoSizeText('Favorite', style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
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
                                    'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return  Container(
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
                                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center ,
                                      children: [
                                        AutoSizeText('House i68', style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),),
                                        AutoSizeText('\$399 / day', style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),),
                                      ],
                                    ),
                                    OnProcessButtonWidget(
                                      height: 20.h,
                                      backgroundColor: AppColors.kPrimaryColor,
                                      child: AutoSizeText('Book Now', style: TextStyle(fontSize: 13.sp, color: AppColors.kWhiteColor),),
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
                          child: Icon(Icons.favorite, color: AppColors.kPrimaryColor, size: 20.r,),
                        ))
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
