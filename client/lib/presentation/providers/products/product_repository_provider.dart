import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/infrastructure/datasourcers/datasources.dart';
import 'package:flutter_version/infrastructure/repositories/product_repository_impl.dart';

final productRepositoryProvider = Provider((ref) {
  //final datasource = LocalProductDatasource();
  final datasource = DummyProductDatasource();
  return ProductRepositoryImpl(datasource: datasource);
});
