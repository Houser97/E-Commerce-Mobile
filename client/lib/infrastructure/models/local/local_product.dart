class LocalProduct {
  final int id;
  final String title;
  final double price;
  final String image;
  final double rating;
  final List<String> categories;

  LocalProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.categories,
  });

  factory LocalProduct.fromJson(Map<String, dynamic> json) => LocalProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        categories: List<String>.from(json["categories"].map((x) => x)),
      );
}
