import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends LocalProductRepository {
  final ProductDatasource datasource;
  ProductRepositoryImpl({required this.datasource});
  @override
  Future<List<Product>> getAllLocalProducts({int page = 1, int limit = 20}) {
    return datasource.getAllProducts(limit: limit);
  }

  @override
  Future<List<Product>> getProductsByCategory(String category, {int page = 1, int limit = 20}) {
    return datasource.getProductsByCategory(category, limit: limit);
  }
}
