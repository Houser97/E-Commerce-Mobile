import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/infrastructure/models/dummy/dummy_product.dart';

class DummyProductMapper {
  static Product dummyProductToEntity(DummyProduct dummyProduct) => Product(
        id: dummyProduct.id,
        title: dummyProduct.title,
        price: dummyProduct.price.toDouble(),
        image: dummyProduct.thumbnail,
        rating: dummyProduct.rating.toDouble(),
        categories: [dummyProduct.category],
      );
}
