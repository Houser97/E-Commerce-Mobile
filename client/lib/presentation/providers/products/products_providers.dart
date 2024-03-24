import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/presentation/providers/products/product_repository_provider.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  final fetchMoreProducts = ref.watch(productRepositoryProvider).getProducts;
  return ProductsNotifier(fetchMoreProducts: fetchMoreProducts);
});

typedef GetProductsCallback = Future<List<Product>> Function(String category, String? query);

class ProductsNotifier extends StateNotifier<List<Product>> {
  final GetProductsCallback fetchMoreProducts;
  ProductsNotifier({required this.fetchMoreProducts}) : super([]);

  Future<List<Product>> getProducts({required String category, String? query}) async {
    final products = await fetchMoreProducts(category, query);
    // Esperar a que el árbol de Widgets se renderice antes de modificar este estado.
    await Future.delayed(const Duration(milliseconds: 400));
    state = products;
    return products;
  }
}
