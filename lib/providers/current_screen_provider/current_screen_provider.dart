import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/core/constants/strings/collections.dart';
import 'package:hotel_management/data/models/home/carousel_image_model.dart';
import 'package:hotel_management/data/models/home/top_villa_model.dart';

import '../../data/models/home/villa_model.dart';

class HomeScreenProvider extends ChangeNotifier {

  List<CarouselModel> _carouselList = [];
  List<CarouselModel> get carouselList => _carouselList;

  List<VillaModel> _topVillaList = [];
  List<VillaModel> get topVillaList => _topVillaList;

  List<VillaModel> _allVillaList = [];
  List<VillaModel> get allVillaList => _allVillaList;

  // Fetch image URLs from Firestore
  Future<void> fetchImages() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection(AllFirebaseCollections.sliderImageCollection).get();

      // Map each document to an ImageModel instance
      final List<CarouselModel> images = snapshot.docs.map((doc) {
        return CarouselModel.fromMap(doc.data(), doc.id);
      }).toList();

      _carouselList = images; // Update state with the list of ImageModel objects

      log("data: $_carouselList");
      notifyListeners();
    } catch (e) {
      log('Error fetching images: $e');
    }
  }

  Future<void> fetchTopVillas() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection(AllFirebaseCollections.topVillasCollection).get();

      // Map each document to an ImageModel instance
      final List<VillaModel> topVillas = snapshot.docs.map((doc) {
        return VillaModel.fromMap(doc.data(), doc.id);
      }).toList();

      _topVillaList = topVillas; // Update state with the list of ImageModel objects

      log("data: $_topVillaList");
      notifyListeners();
    } catch (e) {
      log('Error fetching images: $e');
    }
  }

  Future<void> fetchAllVillas() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection(AllFirebaseCollections.allVillasCollection).get();

      // Map each document to an ImageModel instance
      final List<VillaModel> villas = snapshot.docs.map((doc) {
        return VillaModel.fromMap(doc.data(), doc.id);
      }).toList();

      _allVillaList = villas; // Update state with the list of ImageModel objects

      log("all villa data: $_allVillaList");
      notifyListeners();
    } catch (e) {
      log('Error fetching images: $e');
    }
  }


  addFavorite (bool value){

  }

  // Method to add villa information to Firestore when favorite is clicked
  Future<void> addVillaToFavorites(VillaModel villa,BuildContext context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    villa.isFavourite = true;
    try {
      // Add villa to the favouriteVillasCollection
      await _firestore.collection(AllFirebaseCollections.favouriteVillasCollection)
          .doc(villa.id)
          .set(villa.toMap());

      // Update the is_favourite field in the all_villas collection
      await _firestore.collection(AllFirebaseCollections.allVillasCollection)
          .doc(villa.id)
          .update({'is_favourite': true});
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('${villa.name} added to favorites')));
      log('Villa added to favorites and updated: ${villa.name}');
    } catch (e) {
      log('Error adding villa to favorites: $e');
    }
  }

  // Method to remove villa from favorites
  void removeVillaFromFavorites(VillaModel villa, BuildContext context)async {
    // Mark the villa as not a favorite
    villa.isFavourite = false;


    // Optionally: Update Firestore or any other backend
    await FirebaseFirestore.instance.collection(AllFirebaseCollections.favouriteVillasCollection)
        .doc(villa.id)
        .delete();

    // Update the is_favourite field in the all_villas collection
    await FirebaseFirestore.instance.collection(AllFirebaseCollections.allVillasCollection)
        .doc(villa.id)
        .update({'is_favourite': false});

    notifyListeners(); // Notify UI of changes
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${villa.name} removed from favorites!')),
    );
  }



}


final homeScreenProvider = ChangeNotifierProvider<HomeScreenProvider>((ref) => HomeScreenProvider());

final currentIndexProvider = StateProvider<int>((ref) => 0);
