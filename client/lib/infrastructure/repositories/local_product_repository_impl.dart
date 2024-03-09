import 'package:flutter_version/domain/datasources/local_product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/domain/repositories/local_product_repository.dart';

class LocalProductRepositoryImpl extends LocalProductRepository {
  final LocalProductDatasource datasource;
  LocalProductRepositoryImpl({required this.datasource});
  @override
  List<Product> getAllLocalProducts() {
    return datasource.getAllLocalProducts();
  }
}
