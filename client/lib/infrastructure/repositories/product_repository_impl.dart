import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends LocalProductRepository {
  final ProductDatasource datasource;
  ProductRepositoryImpl({required this.datasource});

  @override
  Future<List<Product>> getProducts(String category, String? query, {int page = 1, int limit = 20}) {
    return datasource.getProducts(category, query ?? '');
  }
}
