class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final int? quantity;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 0,
  });
}
