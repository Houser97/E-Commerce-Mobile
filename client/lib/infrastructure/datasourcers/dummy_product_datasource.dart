import 'package:dio/dio.dart';
import 'package:flutter_version/domain/datasources/product_datasource.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/infrastructure/mappers/dummy_product_mapper.dart';
import 'package:flutter_version/infrastructure/models/dummy/dummy_product_response.dart';

class DummyProductDatasource extends ProductDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/products'));

  List<Product> _jsonToProduct(Map<String, dynamic> json) {
    final dummyProductReponse = DummyProductsResponse.fromJson(json);
    final List<Product> products = dummyProductReponse.products.map((product) => DummyProductMapper.dummyProductToEntity(product)).toList();
    return products;
  }

  @override
  Future<List<Product>> getAllProducts({int page = 1, int limit = 20}) async {
    final response = await dio.get('/', queryParameters: {'limit': 80});
    return _jsonToProduct(response.data);
  }

  @override
  Future<List<Product>> getProductsByCategory(String category, {int page = 1, int limit = 20}) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }
}
