
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarProvider extends StateNotifier<int> {
  NavBarProvider() : super(0);

  // final pages = [
  //   const HomeScreen(), //--------------------------index 0
  //   const FindProductScreen(), //--------------------------index 1
  //   const BookServiceScreen(), //--------------------------index 2
  //   const AccountScreen(), //--------------------------index 3
  // ];

  void changeIndex(int index) {
    state = index;
  }
}

final navBarProvider = StateNotifierProvider<NavBarProvider, int>((ref) {
  return NavBarProvider();
});