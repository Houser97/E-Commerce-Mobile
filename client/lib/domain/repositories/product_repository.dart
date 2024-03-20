import 'package:flutter_version/domain/entities/product.dart';

abstract class LocalProductRepository {
  Future<List<Product>> getProducts(String category, String? query, {int page = 1, int limit = 20});
}
