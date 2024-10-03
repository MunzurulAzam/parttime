import 'package:cloud_firestore/cloud_firestore.dart';
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

    if (_currentUser != null) {
      await saveUserSession(_currentUser!.uid);
      _isAuthenticated = true;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser!.uid)
          .get();

      if (!userDoc.exists) {
        // If not exists, add the user to Firestore
        await FirebaseFirestore.instance.collection('users').doc(_currentUser!.uid).set({
          'name': googleUser.displayName,
          'email': googleUser.email,
          'uid': _currentUser!.uid,
          'createdAt': DateTime.now().toString(),
        });
      }

      notifyListeners();
    }

    return _currentUser;
  } catch (e) {
    log(e.toString());
    return null;
  }
}

  //!--------------------------------firebase auth sign-up with email
Future<bool> signUpWithEmail(String name, String email, String password) async {
  try {
    // Attempt to create a new user with email and password
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    _currentUser = userCredential.user;

    // If user creation was successful
    if (_currentUser != null) {
      // Save user session
      await saveUserSession(_currentUser!.uid);
      _isAuthenticated = true;
    // If user creation was successful
    if (_currentUser != null) {
      // Save user session
      await saveUserSession(_currentUser!.uid);
      _isAuthenticated = true;

      // Store user information in Firestore
      await FirebaseFirestore.instance.collection('users').doc(_currentUser!.uid).set({
        'name': name,
        'email': email,
        'uid': _currentUser!.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Notify listeners if you're using a provider or similar state management solution
      notifyListeners();

      // Return true for success
      return true;
    }
    
    // Return false if user creation failed (this case should rarely occur if there was no error)
    return false;
  } catch (e) {
    // Log the error and return false for failure
    log(e.toString());
    return false;
  }
}

  //!--------------------------------firebase auth sign-in with email
Future<bool> signInWithEmail(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    _currentUser = userCredential.user;

    if (_currentUser != null) {
      await saveUserSession(_currentUser!.uid);
      _isAuthenticated = true;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser!.uid)
          .get();

      if (!userDoc.exists) {
        await FirebaseFirestore.instance.collection('users').doc(_currentUser!.uid).set({
          'email': email,
          'uid': _currentUser!.uid,
          'createdAt': DateTime.now().toString(),
        });
      }

      notifyListeners();
      return true;
    } else {
      return false;
    }
  } on FirebaseAuthException catch (e) {
    // Handle specific Firebase exceptions
    if (e.code == 'user-not-found') {
      log('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided.');
    } else {
      log(e.message ?? 'An unknown error occurred');
    }
    return false;
  } catch (e) {
    log(e.toString());
    return false;
    return false;
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

  //!_____________________________________________________for update information

 Future<void> updateUserProfile({
  required String name,
  required String email,
  required String phone,
}) async {
  try {
    if (_currentUser != null) {
      await _currentUser!.updateEmail(email);
      log("Email updated successfully");

      //!__________________________________________________________________________________________ Update Firestore user data
      await FirebaseFirestore.instance.collection('users').doc(_currentUser!.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
      }, SetOptions(merge: true)); 
       
      _currentUser = FirebaseAuth.instance.currentUser;

      log("User profile updated successfully");
      notifyListeners();
    } else {
      log("No user is currently signed in.");
    }
  } catch (e) {
    log("Failed to update profile: $e");
  }
}


}

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {  return AuthProvider();});
