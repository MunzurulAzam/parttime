import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  User? _currentUser;
  User? get currentUser => _currentUser;

  //!--------------------------------firebase auth login with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      _currentUser = userCredential.user;

      // Save session
      if (_currentUser != null) {
        await saveUserSession(_currentUser!.uid);
        _isAuthenticated = true;
        notifyListeners();
      }

      return _currentUser;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //!--------------------------------firebase auth sign-up with email
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = userCredential.user;

      // Save session
      if (_currentUser != null) {
        await saveUserSession(_currentUser!.uid);
        _isAuthenticated = true;
        notifyListeners();
      }

      return _currentUser;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //!--------------------------------firebase auth sign-in with email
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = userCredential.user;

      // Save session
      if (_currentUser != null) {
        await saveUserSession(_currentUser!.uid);
        _isAuthenticated = true;
        notifyListeners();
      }

      return _currentUser;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //!--------------------------------firebase auth sign-out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
    await clearUserSession();
  }

  //!--------------------------------shared preferences: save session
  Future<void> saveUserSession(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  //!--------------------------------shared preferences: clear session
  Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  //!--------------------------------shared preferences: check session
  Future<void> checkUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      _isAuthenticated = true;
      log("logged in and checked");

      notifyListeners();
    }
  }

  //!--------------------------------check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    log(prefs.containsKey('userId').toString());
    return prefs.containsKey('userId');
  }
}

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {  return AuthProvider();});
