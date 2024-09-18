import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/presentations/screens/chat/chat_screen.dart';
import 'package:hotel_management/presentations/screens/favorite/favorites_scrren.dart';
import 'package:hotel_management/presentations/screens/home/home_screen_main.dart';
import 'package:hotel_management/presentations/screens/profile/profile_screen.dart';
import 'package:hotel_management/presentations/screens/trip/trip_screen.dart';
import 'package:hotel_management/presentations/widgets/bottom_navbar.dart';
import 'package:hotel_management/providers/main_riverpod_provider.dart';
import 'package:hotel_management/providers/nav_bar_provider.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
     final currentIndex = ref.watch(navBarProvider);
    final navBarController = ref.read(navBarProvider.notifier);
    final mainProvider = ref.watch(mainNotifierProvider.notifier);
       // Define pages here in the UI class
    final pages = [
      const HomeScreens(),   // index 0
      const TripScreens(), // index 1
      // const ChatScreen(), // index 2
      const FavoriteScreen(), // index 3
      const ProfileScreen(), // index 3
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          navBarController.changeIndex(index);
        },
      ),
    );
  }
}