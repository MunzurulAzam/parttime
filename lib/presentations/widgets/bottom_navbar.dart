
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_management/core/constants/assets/app_icons.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/utils/size_config.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.selectedIndex = 0, required this.onItemSelected});

  final int selectedIndex;
  final void Function(int index) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: getScreenHeight(40 * 2.4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(getBorderRadius(15)),
            topRight: Radius.circular(getBorderRadius(15)),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kGrayIconColor.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, -3), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(getBorderRadius(15)),
            topRight: Radius.circular(getBorderRadius(15)),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.kPrimaryColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.kWhiteColor,
              selectedLabelStyle: const TextStyle(
              color: AppColors.kWhiteColor, // Set color for selected label
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: AppColors.kGrayIconColor, // Set color for unselected label
            ),
            currentIndex: selectedIndex,
            onTap: onItemSelected,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? AppColors.kWhiteColor : AppColors.kWhiteColor.withOpacity(0.4),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trip_origin,
                  color: selectedIndex == 1 ? AppColors.kWhiteColor : AppColors.kWhiteColor.withOpacity(0.4),
                ),
                label: 'Booking',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.chat,
              //     color: selectedIndex == 2 ? AppColors.kWhiteColor : AppColors.kWhiteColor.withOpacity(0.4),
              //   ),
              //   label: 'Chat',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                  color: selectedIndex == 2 ? AppColors.kWhiteColor : AppColors.kWhiteColor.withOpacity(0.4),
                ),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 3 ? AppColors.kWhiteColor : AppColors.kWhiteColor.withOpacity(0.4),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}