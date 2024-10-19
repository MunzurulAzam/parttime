import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/utils/size_config.dart';
import 'package:hotel_management/providers/current_screen_provider/current_screen_provider.dart';
import 'package:hotel_management/providers/product_details_provider/product_details_provider.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/assets/app_images.dart';

class CarosoleforDetails extends ConsumerWidget {
  const CarosoleforDetails({super.key, this.dotIndicator = true});
  final bool dotIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailVillaProvider = ref.watch(detailsProvider);
    final currentIndex = ref.watch(currentIndexProvider);

    // log("images data: ${detailVillaProvider.details?.images}");
    return Column(
      children: [
        // Check if the images list is non-null and has items
        detailVillaProvider.details?.images.isNotEmpty == true
            ? CarouselSlider(
          items: detailVillaProvider.details?.images
              .map((item) => Container(
            margin: EdgeInsets.only(right: 10), // Adjust your margin utility here
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust your borderRadius utility here
                  child: CachedNetworkImage(
                    imageUrl: item,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 1000,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: 1000,
                      height: 300.h,
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
                      width: 1000,
                      height: 300.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        color: AppColors.kDividerColor,
                      ),
                    ),
                  )


              ),
            ),
          ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.5,
            padEnds: false,
            enableInfiniteScroll: false,
            autoPlay: true,
            enlargeCenterPage: false,
            aspectRatio: 1.5,
            onPageChanged: (index, reason) {
              ref.read(currentIndexProvider.notifier).state = index;
            },
          ),
        )
            : const SizedBox.shrink(),

        // Dot indicator section
        if (detailVillaProvider.details?.images.isNotEmpty == true)
          dotIndicator == false
              ? const SizedBox.shrink()
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: detailVillaProvider.details!.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => ref.read(currentIndexProvider.notifier).state = entry.key,
                child: Container(
                  width: 8,  // Adjust your dot size utility here
                  height: 8, // Adjust your dot size utility here
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0), // Adjust your margin utility here
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.withOpacity(0.3)
                        : Colors.blue) // Adjust your color utility here
                        .withOpacity(currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}

