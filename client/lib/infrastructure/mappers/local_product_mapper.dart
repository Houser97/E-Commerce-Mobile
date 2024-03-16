import 'package:flutter_version/domain/entities/product.dart';

class ProductMapper {
  static Product localProductToEntity(Map<String, dynamic> localProduct) => Product(
        id: localProduct["id"],
        title: localProduct["title"],
        price: localProduct["price"],
        image: localProduct["image"],
        rating: localProduct["rating"]?.toDouble(),
        categories: List<String>.from(localProduct["categories"].map((x) => x)),
      );
}
