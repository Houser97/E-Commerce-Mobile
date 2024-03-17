import 'package:flutter_version/infrastructure/models/dummy/dummy_product.dart';

class DummyProductsResponse {
  final List<DummyProduct> products;
  final int total;
  final int skip;
  final int limit;

  DummyProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory DummyProductsResponse.fromJson(Map<String, dynamic> json) => DummyProductsResponse(
        products: List<DummyProduct>.from(json["products"].map((x) => DummyProduct.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}
