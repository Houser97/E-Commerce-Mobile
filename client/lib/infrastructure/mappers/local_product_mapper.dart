import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/infrastructure/models/local/local_product.dart';

class ProductMapper {
  static Product localProductToEntity(LocalProduct localProduct) => Product(
        id: localProduct.id,
        title: localProduct.title,
        price: localProduct.price,
        image: localProduct.image,
        categories: localProduct.categories,
        rating: localProduct.rating,
      );
}
