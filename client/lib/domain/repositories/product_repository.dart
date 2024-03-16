import 'package:flutter_version/domain/entities/product.dart';

abstract class LocalProductRepository {
  List<Product> getAllLocalProducts();
  List<Product> getProductsByCategory(String category);
}
