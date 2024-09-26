import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/routes/app_routes.dart';
import '../../main.dart';
import '../auth_provider/auth_provider.dart';

class SplashNotifier extends StateNotifier<void> {
  Timer? timer;
  final Ref ref; // Hold a reference to ref for reading other providers

  SplashNotifier(this.ref) : super(null) {
    init();
  }

  Future<void> init() async {
    timer = Timer(const Duration(seconds: 1), () async {
      log("initState");
      // Use ref to access the authProvider
      bool isLoggedIn = await ref.read(authProvider).isLoggedIn();

      if (isLoggedIn) {
        // Navigate to home if user is logged in
        Navigator.pushReplacementNamed(appContext, RouteName.navigationScreen);
      } else {
        // Go to another page if user is not logged in
        goNext();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void goNext() {
    Navigator.of(appContext).pushNamedAndRemoveUntil(RouteName.staterPage, (route) => false);
  }
}

// Provide the SplashNotifier with ref access using StateNotifierProvider
final splashNotifierProvider = StateNotifierProvider<SplashNotifier, void>((ref) {
  return SplashNotifier(ref);
});
