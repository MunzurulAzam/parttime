import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    required String villaID,
    required String bookingStartDate,
    required String bookingEndDate,
    required String dayCount,
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
        });

        // update villa_details is_booked to true
        await FirebaseFirestore.instance.collection('villa_details').doc(villaID).update({
          'is_booked': true,
        });

        // Success
        log('Payment Success: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('${jsonDecode(response.body)['message']}')),
        );

        _isProcessing = false;

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