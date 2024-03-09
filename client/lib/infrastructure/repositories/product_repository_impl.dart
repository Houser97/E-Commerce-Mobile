import 'package:flutter_version/domain/datasources/local_product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/domain/repositories/local_product_repository.dart';

class ProductRepositoryImpl extends LocalProductRepository {
  final LocalProductDatasource datasource;
  ProductRepositoryImpl({required this.datasource});
  @override
  List<Product> getAllLocalProducts() {
    return datasource.getAllLocalProducts();
  }
}
