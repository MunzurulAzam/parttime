import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsProvider extends ChangeNotifier {
  List<Item> items = [];

  ProductDetailsProvider() {
    items.addAll(generateItems());
  }

  void togglePanel(int index) {
    items[index].isExpanded = !items[index].isExpanded;
    notifyListeners();
  }

  List<Item> generateItems() {
    return [
      Item(
        headerValue: 'Additional Info ',
        expandedValues: ['Max Guest', 'Adults', 'kids'],
        endValues: ['10', '5', '8'],
      ),
      Item(
        headerValue: 'Rent Info',
        expandedValues: ['Daily Rent', 'Cleaning Fees', 'Service Fees', 'Extras', 'Airport pic up', 'Extra Beds'],
        endValues: ['\$650', '\$80', '\$800', '\$0', '\$50', '\$100'],
      ),
      Item(
        headerValue: 'Room Info',
        expandedValues: [
          'Bed Rooms',
          'Living Room',
          'Kitchens',
          'Bathrooms',
          'Gym',
        ],
        endValues: ['3', '1', '1', '2', '1'],
      ),
      Item(
        headerValue: 'Top Amenities',
        expandedValues: [
          'Kitchen',
          'Wifi',
          'Dedicated workspace',
          'Free parking on premises',
          'Pool',
          'Private hot tub',
          'Pets allowed',
          'TV',
          'Washer',
          'Dryer'
        ],
        endValues: ['-', '-', '-', '-', '-', '-', '-', '-', '-', '-'],
      ),
      // Item(
      //   headerValue: 'Cancellation Policy',
      //   expandedValues: ['We offer a complete refund for cancellations made 24 hours prior to the booking time',],
      //   endValues: [''],
      // ),
    ];
  }
}

class Item {
  Item({
    required this.expandedValues,
    required this.headerValue,
    required this.endValues,
    this.isExpanded = false,
  });

  List<String> expandedValues;
  String headerValue;
  List<String> endValues;
  bool isExpanded;
}

final profileProvider = ChangeNotifierProvider((_) => ProductDetailsProvider());
