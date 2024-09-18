
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenProvider extends StateNotifier<List<String>> {
  HomeScreenProvider() : super([
    'https://i.postimg.cc/mZmHXGXB/dummy-image.png',
    'https://i.postimg.cc/mZmHXGXB/dummy-image.png',
    'https://i.postimg.cc/mZmHXGXB/dummy-image.png',
    'https://i.postimg.cc/mZmHXGXB/dummy-image.png',
    'https://i.postimg.cc/mZmHXGXB/dummy-image.png',
  ]);
}



// Provider for HomeScreenProvider
final homeScreenProvider =
    StateNotifierProvider<HomeScreenProvider, List<String>>((ref) {
  return HomeScreenProvider();
});

final currentIndexProvider = StateProvider<int>((ref) => 0);