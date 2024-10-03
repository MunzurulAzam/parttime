import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileProvider extends ChangeNotifier {
DocumentSnapshot? _userDoc;

  DocumentSnapshot? get userDoc => _userDoc;

  Future<void> fetchUserData(String? uid) async {
    if (uid == null) return;
    try {
      _userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      notifyListeners();
    } catch (e) {
      log('Error fetching user data: $e');
    }
  }

}

final profileUpdateProvider = ChangeNotifierProvider((ref) => ProfileProvider());