import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/data/models/home/villa_model.dart';

import '../../core/constants/strings/collections.dart';

class FavouriteProvider extends ChangeNotifier {

  List<VillaModel> _favouriteList = [];
  List<VillaModel> get favouriteListValue => _favouriteList;

  bool _isLoading = false;
  bool get isLoadingValue => _isLoading;


  Future<void> fetchAllFavourites() async {
    _isLoading = true;
    try {
      final snapshot = await FirebaseFirestore.instance.collection(AllFirebaseCollections.favouriteVillasCollection).get();
      final List<VillaModel> favourites = snapshot.docs.map((doc) {
        return VillaModel.fromMap(doc.data(), doc.id);
      }).toList();
      _favouriteList = favourites;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      log('Error fetching images: $e');
    }
  }

  Future<void> deleteVillaFromFavorites(String villaId,BuildContext context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      // Delete villa from the favouriteVillasCollection
      await _firestore.collection(AllFirebaseCollections.favouriteVillasCollection)
          .doc(villaId)
          .delete();

      // Update the is_favourite field in the all_villas collection
      await _firestore.collection(AllFirebaseCollections.allVillasCollection)
          .doc(villaId)
          .update({'is_favourite': false});

      log('Villa removed from favorites and updated: $villaId');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Villa removed from favorites')));
      // fetchAllFavourites();
      notifyListeners();
    } catch (e) {
      log('Error removing villa from favorites: $e');
    }
  }





}

final favouriteProvider = ChangeNotifierProvider<FavouriteProvider>((ref) => FavouriteProvider());