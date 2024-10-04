import 'dart:convert';
import 'dart:developer';
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
      _isProcessing = false;
      log('Response: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Success
        log('Payment Success: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('${jsonDecode(response.body)['message']}')),
        );
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
