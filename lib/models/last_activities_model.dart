class LastActivitiesModel {
  int? id;
  String? title;
  String? description;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  LastActivitiesModel({
    this.id,
    this.title,
    this.description,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory LastActivitiesModel.fromJson(Map<String, dynamic> json) {
    return LastActivitiesModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      // images alanını doğrudan liste olarak işle
      images: List<String>.from(json['images']),
    );
  }
}
