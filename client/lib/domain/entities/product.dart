class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final double rating;
  final List<String> categories;
  final int? quantity;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.categories,
    this.quantity = 0,
  });
}
