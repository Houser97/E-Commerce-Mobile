import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/presentation/providers/products/product_repository_provider.dart';

final allProductsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  final getAllProducts = ref.watch(productRepositoryProvider).getAllLocalProducts;
  return ProductsNotifier(getAllProducts: getAllProducts);
});

final productsByCategoryProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  final searchByCategory = ref.watch(productRepositoryProvider).getProductsByCategory;
  return ProductsNotifier(getProductsByCategory: searchByCategory);
});

typedef SearchByCallback = Future<List<Product>> Function(String category);
typedef GetAllCallback = Future<List<Product>> Function();

class ProductsNotifier extends StateNotifier<List<Product>> {
  final SearchByCallback? getProductsByCategory;
  final GetAllCallback? getAllProducts;
  ProductsNotifier({this.getProductsByCategory, this.getAllProducts}) : super([]);

  Future<List<Product>> searchProductByCategory(String category) async {
    if (getProductsByCategory == null) return [];
    final products = await getProductsByCategory!(category);
    // Esperar a que el árbol de Widgets se renderice antes de modificar este estado.
    await Future.delayed(const Duration(milliseconds: 400));
    state = products;
    return products;
  }

  Future<List<Product>> getProducts() async {
    if (getAllProducts == null) return [];
    final products = await getAllProducts!();
    // Esperar a que el árbol de Widgets se renderice antes de modificar este estado.
    await Future.delayed(const Duration(milliseconds: 400));
    state = products;
    return products;
  }
}
