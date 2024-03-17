import 'package:flutter_version/domain/entities/product.dart';

abstract class ProductDatasource {
  Future<List<Product>> getAllProducts({int page = 1, int limit = 20});
  Future<List<Product>> getProductsByCategory(String category, {int page = 1, int limit = 20});
}
