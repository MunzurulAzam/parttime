import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';
import 'package:hotel_management/providers/product_details_provider/product_details_provider.dart';

class ExpandedPanel extends ConsumerWidget {
  const ExpandedPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(profileProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: provider.items.length,
        itemBuilder: (BuildContext context, int index) {
          Item item = provider.items[index];
          return Column(
            children: [
              OnProcessButtonWidget(
                backgroundColor: Colors.black,
                margin: EdgeInsets.only(bottom: 7.h),
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ListTileTheme(
                    child: ExpansionTile(
                      trailing: Icon(
                        item.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_right,
                        color: AppColors.kPrimaryColor,
                      ),
                      backgroundColor: Colors.black,
                      title: Text(item.headerValue,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14.sp, color: Theme.of(context).primaryColor)),
                      onExpansionChanged: (bool isExpanded) {
                        provider.togglePanel(index);
                      },
                      initiallyExpanded: item.isExpanded,
                      children: item.expandedValues.asMap().entries.map((entry) {
                        int idx = entry.key;
                        String expandedValue = entry.value;
                        return GestureDetector(
                          onTap: () {
                            // if (expandedValue == 'My Orders') {
                            //   Navigator.pushNamed(context, RouteName.myOrder);
                            // }
                            debugPrint(expandedValue);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align texts at the start and end
                                children: [
                                  Text(
                                    expandedValue,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontSize: 14.w,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  Text(
                                    item.endValues[idx],
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontSize: 14.w,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const CustomDividedBar(color: AppColors.kPrimaryColor),
            ],
          );
        },
      ),
    );
  }
}
