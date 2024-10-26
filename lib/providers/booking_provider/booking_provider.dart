import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> bookings = [];

  Future<void> fetchBookings() async {
    try {
      final snapshot = await _firestore
          .collection('bookings')
          .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser?.uid) // Filter by uid
          .get();

      bookings = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching bookings: $e');
    }
  }


// Future<void> fetchBookings() async {
  //   try {
  //     final snapshot = await _firestore.collection('bookings').get();
  //     bookings = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  //     notifyListeners();
  //   } catch (e) {
  //     print('Error fetching bookings: $e');
  //   }
  // }

}

final bookingProvider = ChangeNotifierProvider((ref) => BookingProvider());