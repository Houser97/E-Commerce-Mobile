import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/infrastructure/mappers/local_product_mapper.dart';
import 'package:flutter_version/shared/data/local_products.dart';

class LocalProductDatasource extends ProductDatasource {
  List<Product> _jsonToProducts(json) {
    return json.map((localProduct) => ProductMapper.localProductToEntity(localProduct)).toList();
  }

  @override
  List<Product> getAllProducts() {
    return _jsonToProducts(products);
  }

  @override
  List<Product> getProductsByCategory(String category) {
    if (category == 'All') return getAllProducts();
    return _jsonToProducts(products).where((product) => product.categories.contains(category)).toList();
  }
}
