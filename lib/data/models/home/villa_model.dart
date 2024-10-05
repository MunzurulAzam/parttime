class VillaModel {
  final String? id;
  final String? imgUrl;
  final String? name;
  final String? location;
  final String? createdAt;
  final String? price;
    bool? isFavourite;

  VillaModel({
    this.id,
    this.imgUrl,
    this.name,
    this.location,
    this.createdAt,
    this.isFavourite = false,
    this.price,
  });

  // Factory method to create an instance from a Firestore document
  factory VillaModel.fromMap(Map<String, dynamic> data, String documentId) {
    return VillaModel(
      id: documentId,
      imgUrl: data['img_url'] ?? '',
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      createdAt: data['created_at'] ?? '',
      price: data['price'] ?? '',
      isFavourite: data['is_favourite'] ?? false,
    );
  }

  // Convert this model into a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'img_url': imgUrl,
      'name': name,
      'location': location,
      'created_at': createdAt,
      'price': price,
      'is_favourite': isFavourite,
    };
  }
}
