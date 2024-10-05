import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/data/models/details/villa_details.dart';

class ProductDetailsProvider extends ChangeNotifier {
  List<Item> items = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  VillaDetailsModel? _details;

  VillaDetailsModel? get details => _details;

  String? _totalAmount;

  String? get totalAmount => _totalAmount;

  int? _dayCount;

  int? get dayCount => _dayCount;

  double? _taxFeeTotalAmount;
  double? get taxFeeTotalAmount => _taxFeeTotalAmount;

  DateTime? _startDate;

  DateTime? get startDate => _startDate;
  DateTime? _endDate;

  DateTime? get endDate => _endDate;
  final TimeOfDay _fixedTime = const TimeOfDay(hour: 12, minute: 0); // Fixed to 12 PM
  TimeOfDay get fixedTime => _fixedTime;

  Future<void> fetchVillaDetails(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('villa_details').doc(id).get();

      if (doc.exists) {
        _details = VillaDetailsModel.fromFirestore(doc.data() as Map<String, dynamic>);

        Future.delayed(const Duration(milliseconds: 500));
        _isLoading = false;

        getTotalAmount();
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

  void getTotalAmount() {
    int dailyRent = int.parse(_details?.dailyRent ?? '0') * (dayCount ?? 0);
    int cleaningFees = int.parse(_details?.cleaningFees ?? '0') * (dayCount ?? 0);

    double tax = int.parse(_details?.tax ?? '0') / 100;
    double dailyRentWithTax = dailyRent*tax;

    _taxFeeTotalAmount = dailyRentWithTax;

    int serviceFees = int.parse(_details?.serviceFees ?? '0');
    int airportPicUp = int.parse(_details?.airportPickup ?? '0');
    int extraBeds = int.parse(_details?.extraBeds ?? '0');


    int oneTimeFees = (serviceFees + airportPicUp + extraBeds);

    double totalFees = dailyRentWithTax + cleaningFees + oneTimeFees;

    log(
      "daily rent $dailyRent cleaning fees $cleaningFees service fees $serviceFees "
          "airport pic up $airportPicUp extra beds $extraBeds tax $tax one time $oneTimeFees with tax $dailyRentWithTax",
    );

    _totalAmount = totalFees.toString();
    notifyListeners();
  }

  // Function to show Date Range Picker
  Future<void> selectBookingDates(BuildContext context) async {
    DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _startDate != null && _endDate != null ? DateTimeRange(start: _startDate!, end: _endDate!) : DateTimeRange(start: now, end: now.add(const Duration(days: 1))),
      firstDate: now,
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      _startDate = picked.start;
      _endDate = picked.end;
      log("start date ${picked.start}");
      log("end date ${picked.end}");
      _dayCount = picked.end.difference(picked.start).inDays;
      log("day count $_dayCount");
      getTotalAmount();

      notifyListeners();
    }
    notifyListeners();
  }

  // Function to show time pickers for start and end times
  // Future<void> selectBookingTimes(BuildContext context) async {
  //   final TimeOfDay? pickedStartTime = await showTimePicker(
  //     context: context,
  //     initialTime: _startTime, // Default to 12 PM
  //   );
  //
  //   if (pickedStartTime != null) {
  //       _startTime = pickedStartTime;
  //   }
  //
  //   final TimeOfDay? pickedEndTime = await showTimePicker(
  //     context: context,
  //     initialTime: _endTime, // Default to 12 PM
  //   );
  //
  //   if (pickedEndTime != null) {
  //       _endTime = pickedEndTime;
  //   }
  // }

  // Function to format the date and time
  String formatDateTime(DateTime date,TimeOfDay time, BuildContext context) {
    final formattedDate = '${date.day}/${date.month}/${date.year}';

    final formattedTime = _fixedTime.format(context); // Always show 12 PM

    log("date time: ${DateTime(date.year, date.month, date.day, _fixedTime.hour, _fixedTime.minute)}");

    return '$formattedDate $formattedTime';
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

final detailsProvider = ChangeNotifierProvider((_) => ProductDetailsProvider());
