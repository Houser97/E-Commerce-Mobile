import 'package:flutter_version/domain/entities/product.dart';

abstract class ProductDatasource {
  List<Product> getAllLocalProducts();
}
