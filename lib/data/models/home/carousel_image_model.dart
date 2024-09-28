class CarouselModel {
  final String id;
  final String imgUrl;

  CarouselModel({required this.id, required this.imgUrl});

  // Factory method to create an instance from a Firestore document
  factory CarouselModel.fromMap(Map<String, dynamic> data, String documentId) {
    return CarouselModel(
      id: documentId,
      imgUrl: data['img_url'] ?? '',
    );
  }
}
