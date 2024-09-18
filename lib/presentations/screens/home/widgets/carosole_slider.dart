import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/utils/size_config.dart';
import 'package:hotel_management/providers/current_screen_provider/current_screen_provider.dart';

class CarouselSliderWidget extends ConsumerWidget {
  const CarouselSliderWidget({super.key, this.dotIndicator = true});
  final bool dotIndicator;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final homeState = ref.watch(homeprovider);
    // final imgList = homeState.homePageUpperModel!.slider!.map((e) => e.image!).toList(); // get slider image
    final currentIndex = ref.watch(currentIndexProvider);
    final imgList = [
      'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
      'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
      'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
      'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
      'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
    ];
    return Column(
      children: [
        imgList.isNotEmpty
            ? CarouselSlider(
                items: imgList
                    .map((item) => Container(
                          margin: EdgeInsets.only(right: getScreenWidth(10)),
                          child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(getBorderRadius(20)),
                                child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: 1000,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppColors.kWhiteColor,
                                    );
                                  },
                                )),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  padEnds: false,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    ref.read(currentIndexProvider.notifier).state = index;
                  },
                ),
              )
            : const SizedBox.shrink(),
        if (imgList.isNotEmpty)
          dotIndicator == false
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => ref.read(currentIndexProvider.notifier).state = entry.key,
                      child: Container(
                        width: getScreenWidth(8),
                        height: getScreenHeight(8),
                        margin: EdgeInsets.symmetric(vertical: getScreenHeight(8.0), horizontal: getScreenHeight(4.0)),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (Theme.of(context).brightness == Brightness.dark ? AppColors.kGrayIconColor.withOpacity(0.3) : AppColors.kPrimaryColor)
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
