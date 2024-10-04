class VillaDetailsModel {
  final String adults;
  final String airportPickup;
  final bool amDedicatedWorkspace;
  final bool amDryer;
  final bool amFreeParking;
  final bool amKitchen;
  final bool amPetAllowed;
  final bool amPool;
  final bool amPrivateHotHub;
  final bool amTv;
  final bool amWasher;
  final bool amWifi;
  final String bathroom;
  final String bedRoom;
  final String children;
  final String cleaningFees;
  final String dailyRent;
  final String desc;
  final String extraBeds;
  final String gym;
  final String id;
  final String kitchen;
  final String livingRoom;
  final String maxGuest;
  final String review;
  final String serviceFees;
  final String title;
  final List<String> images;
<<<<<<< HEAD
  final String? tax;
  final String? discount;
  final String? coupon;
  final String? location;
=======
>>>>>>> 90d7495 (villa details done and payment implemented)

  VillaDetailsModel({
    required this.adults,
    required this.airportPickup,
    required this.amDedicatedWorkspace,
    required this.amDryer,
    required this.amFreeParking,
    required this.amKitchen,
    required this.amPetAllowed,
    required this.amPool,
    required this.amPrivateHotHub,
    required this.amTv,
    required this.amWasher,
    required this.amWifi,
    required this.bathroom,
    required this.bedRoom,
    required this.children,
    required this.cleaningFees,
    required this.dailyRent,
    required this.desc,
    required this.extraBeds,
    required this.gym,
    required this.id,
    required this.kitchen,
    required this.livingRoom,
    required this.maxGuest,
    required this.review,
    required this.serviceFees,
    required this.title,
    required this.images,
<<<<<<< HEAD
    this.tax,
    this.discount,
    this.coupon,
    this.location,
=======
>>>>>>> 90d7495 (villa details done and payment implemented)
  });

  factory VillaDetailsModel.fromFirestore(Map<String, dynamic> data) {
    return VillaDetailsModel(
      adults: data['adults'],
      airportPickup: data['airport_pickup'],
      amDedicatedWorkspace: data['am_dedicated_workspace'],
      amDryer: data['am_dryer'],
      amFreeParking: data['am_free_parking'],
      amKitchen: data['am_kitchen'],
      amPetAllowed: data['am_pet_allowed'],
      amPool: data['am_pool'],
      amPrivateHotHub: data['am_private_hot_hub'],
      amTv: data['am_tv'],
      amWasher: data['am_washer'],
      amWifi: data['am_wifi'],
      bathroom: data['bathroom'],
      bedRoom: data['bed_room'],
      children: data['children'],
      cleaningFees: data['cleaning_fees'],
      dailyRent: data['daily_rent'],
      desc: data['desc'],
      extraBeds: data['extra_beds'],
      gym: data['gym'],
      id: data['id'],
      kitchen: data['kitchen'],
      livingRoom: data['living_room'],
      maxGuest: data['max_guest'],
      review: data['review'],
      serviceFees: data['service_fees'],
      title: data['title'],
      images: List<String>.from(data['images']),
<<<<<<< HEAD
      tax: data['tax'] ?? '',
      discount: data['discount'] ?? '',
      coupon: data['coupon'] ?? '',
      location: data['location'] ?? '',

=======
>>>>>>> 90d7495 (villa details done and payment implemented)
    );
  }
}
