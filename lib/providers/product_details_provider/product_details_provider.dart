import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/data/models/details/villa_details.dart';
import 'package:hotel_management/data/models/details/villa_details.dart';

class ProductDetailsProvider extends ChangeNotifier {
  List<Item> items = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  VillaDetailsModel? _details;

  VillaDetailsModel? get details => _details;


  Future<void> fetchVillaDetails() async {
    _isLoading = true;
    notifyListeners();
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('villa_details').doc('lDHPJ9VsKzUOlQUFczou').get();

      if (doc.exists) {
        _details = VillaDetailsModel.fromFirestore(doc.data() as Map<String, dynamic>);

        Future.delayed(const Duration(milliseconds: 500));
        _isLoading = false;

        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        log('Document does not exist');
      }
    } catch (error) {
      log('Error fetching post: $error');
      _isLoading = false;
      notifyListeners();
    }
  }

  void togglePanel(int index) {
    items[index].isExpanded = !items[index].isExpanded;
    notifyListeners();
  }

  /*List<Item> generateItems() {
    return [
      // Item(
      //   headerValue: 'Additional Info ',
      //   expandedValues: ['Max Guest', 'Adults', 'kids'],
      //   endValues: ['10', '5', '8'],
      // ),
      // Item(
      //   headerValue: 'Rent Info',
      //   expandedValues: ['Daily Rent', 'Cleaning Fees', 'Service Fees', 'Extras', 'Airport pic up', 'Extra Beds'],
      //   endValues: ['\$650', '\$80', '\$800', '\$0', '\$50', '\$100'],
      // ),
      Item(
        headerValue: 'Room Info',
        expandedValues: [
          'Bed Rooms',
          'Living Room',
          'Kitchens',
          'Bathrooms',
          'Gym',
        ],
        endValues: [
          details?.bedRoom ?? '0',
          details?.livingRoom ?? '0',
          details?.kitchen ?? '0',
          details?.bathroom ?? '0',
          details?.gym ?? '0',
        ],
      ),
      Item(
        headerValue: 'Top Amenities',
        expandedValues: ['Kitchen', 'Wifi', 'Dedicated workspace', 'Free parking on premises', 'Pool', 'Private hot tub', 'Pets allowed', 'TV', 'Washer', 'Dryer'],
        endValues: ['-', '-', '-', '-', '-', '-', '-', '-', '-', '-'],
      ),
      // Item(
      //   headerValue: 'Cancellation Policy',
      //   expandedValues: ['We offer a complete refund for cancellations made 24 hours prior to the booking time',],
      //   endValues: [''],
      // ),
    ];
  }*/
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

final detailsProvider = ChangeNotifierProvider((_) => ProductDetailsProvider());
