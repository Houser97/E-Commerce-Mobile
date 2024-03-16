import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends LocalProductRepository {
  final ProductDatasource datasource;
  ProductRepositoryImpl({required this.datasource});
  @override
  List<Product> getAllLocalProducts() {
    return datasource.getAllProducts();
  }

  @override
  List<Product> getProductsByCategory(String category) {
    return datasource.getProductsByCategory(category);
  }
}
