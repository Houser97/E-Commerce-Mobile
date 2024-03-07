import 'package:flutter_version/domain/entities/product.dart';

abstract class LocalProductDatasource {
  List<Product> getAllLocalProducts();
}
