import 'dart:convert';
import 'dart:developer';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
>>>>>>> 22ed79f (villa details done and payment implemented)
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> e434bd3 (booking data stored to db)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PaymentProvider with ChangeNotifier {
  bool _isProcessing = false;

  bool get isProcessing => _isProcessing;

  Future<bool> processPayment({
    required String cardNumber,
    required String expirationDate,
    required String cvv,
    required double totalAmount,
    required BuildContext context,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    required String villaID,
    required String bookingStartDate,
    required String bookingEndDate,
    required String dayCount,
    required String villaName,
    required String villaLocation,
<<<<<<< HEAD
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
>>>>>>> 8e2bbe7 (booking design updated)
=======
>>>>>>> 22ed79f (villa details done and payment implemented)
=======
    required String villaID,
>>>>>>> e434bd3 (booking data stored to db)
  }) async {

    log("hit server");
    final url = Uri.parse('https://authorize-net-payment-fastapi.onrender.com/process-authorizenet-payment');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "cardNumber": cardNumber,
      "expirationDate": expirationDate,
      "cvv": cvv,
      "totalAmount": totalAmount,
    });

    _isProcessing = true;
    notifyListeners();

    try {
      final response = await http.post(url, headers: headers, body: body);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

      log('Response: ${response.statusCode}');

      if (response.statusCode == 200) {

        // Create a document reference with an auto-generated ID
        final docRef = FirebaseFirestore.instance.collection('bookings').doc();
        await docRef.set({
          'booking_id': docRef.id, // Use the document ID as the 'id' field
          'user_id': FirebaseAuth.instance.currentUser?.uid,
          'user_email': FirebaseAuth.instance.currentUser?.email,
          'user_name': FirebaseAuth.instance.currentUser?.displayName,
          'total_amount': totalAmount.round().toString(),
          'created_at': DateTime.now().toString(),
          'booking_start_date': bookingStartDate,
          'booking_end_date': bookingEndDate,
          'day_count': dayCount,
          'villa_id': villaID ?? "",
          'villa_name' : villaName,
          'villa_location' : villaLocation,
        });

        // update villa_details is_booked to true
        await FirebaseFirestore.instance.collection('villa_details').doc(villaID).update({
          'is_booked': true,
        });

=======
      _isProcessing = false;
      log('Response: ${response.statusCode}');

      if (response.statusCode == 200) {
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
      _isProcessing = false;
      log('Response: ${response.statusCode}');

      if (response.statusCode == 200) {
>>>>>>> 22ed79f (villa details done and payment implemented)
=======

      log('Response: ${response.statusCode}');

      if (response.statusCode == 200) {

        // Create a document reference with an auto-generated ID
        final docRef = FirebaseFirestore.instance.collection('bookings').doc();
        await docRef.set({
          'booking_id': docRef.id, // Use the document ID as the 'id' field
          'user_id': FirebaseAuth.instance.currentUser?.uid,
          'user_email': FirebaseAuth.instance.currentUser?.email,
          'user_name': FirebaseAuth.instance.currentUser?.displayName,
          'total_amount': totalAmount.round().toString(),
          'created_at': DateTime.now().toString(),
        });

        // update villa_details is_booked to true
        await FirebaseFirestore.instance.collection('villa_details').doc(villaID).update({
          'is_booked': true,
        });

>>>>>>> e434bd3 (booking data stored to db)
        // Success
        log('Payment Success: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('${jsonDecode(response.body)['message']}')),
        );
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

        _isProcessing = false;

=======
>>>>>>> 90d7495 (villa details done and payment implemented)
=======
>>>>>>> 22ed79f (villa details done and payment implemented)
=======

        _isProcessing = false;

>>>>>>> e434bd3 (booking data stored to db)
        notifyListeners();
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Payment Failed ${jsonDecode(response.body)['detail']}')),
        );
        // Failure
        log('Payment Failed: ${jsonDecode(response.body)['detail']}');
        notifyListeners();
        return false;

      }
    } catch (e) {
      _isProcessing = false;
      log('Error occurred: $e');
      notifyListeners();
      return false;

    }
  }
}
final paymentProvider = ChangeNotifierProvider<PaymentProvider>((ref) => PaymentProvider());
