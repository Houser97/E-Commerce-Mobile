import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/infrastructure/mappers/local_product_mapper.dart';
import 'package:flutter_version/shared/data/local_products.dart';

class LocalProductDatasource extends ProductDatasource {
  List<Product> _jsonToProducts(List<Map<String, dynamic>> json) {
    final List<Product> products = json.map((localProduct) => ProductMapper.localProductToEntity(localProduct)).toList();
    return products;
  }

  @override
  Future<List<Product>> getAllProducts({int page = 1, int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _jsonToProducts(products);
  }

  @override
  Future<List<Product>> getProductsByCategory(String category, {int page = 1, int limit = 20}) async {
    if (category == 'All') return getAllProducts();
    await Future.delayed(const Duration(milliseconds: 200));
    return _jsonToProducts(products).where((product) => product.categories.contains(category)).toList();
  }
}
