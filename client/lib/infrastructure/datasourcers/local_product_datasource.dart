import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/infrastructure/mappers/local_product_mapper.dart';
import 'package:flutter_version/infrastructure/models/local/local_product.dart';
import 'package:flutter_version/shared/data/local_products.dart';

class LocalProductDatasource extends ProductDatasource {
  @override
  List<Product> getAllLocalProducts() {
    final List<LocalProduct> localProducts = products.map((product) => LocalProduct.fromJson(product)).toList();

    return localProducts.map((localProduct) => ProductMapper.productLocalToEntity(localProduct)).toList();
  }
}
