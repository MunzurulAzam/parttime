class TopVillaModel {
  final String? id;
  final String? imgUrl;
  final String? name;
  final String? location;
  final String? createdAt;

  TopVillaModel({this.id,this.imgUrl,this.name,this.location,this.createdAt});

  // Factory method to create an instance from a Firestore document
  factory TopVillaModel.fromMap(Map<String, dynamic> data, String documentId) {
    return TopVillaModel(
      id: documentId,
      imgUrl: data['img_url'] ?? '',
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      createdAt: data['created_at'] ?? '',
    );
  }
}

