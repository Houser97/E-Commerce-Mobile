import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/presentation/providers/products/product_repository_provider.dart';

final allProductsProvider = Provider<List<Product>>((ref) => ref.watch(productRepositoryProvider).getAllLocalProducts());

final productsByCategoryProvider = StateNotifierProvider<ProductsByCategoryNotifier, List<Product>>((ref) {
  final searchByCategory = ref.watch(productRepositoryProvider).getProductsByCategory;
  return ProductsByCategoryNotifier(searchByCategory);
});

typedef SearchByCategoryCallback = List<Product> Function(String category);

class ProductsByCategoryNotifier extends StateNotifier<List<Product>> {
  SearchByCategoryCallback searchByCategory;
  ProductsByCategoryNotifier(this.searchByCategory) : super([]);

  Future<void> searchProductByCategory(String category) async {
    final products = searchByCategory(category);
    // Esperar a que el árbol de Widgets se renderice antes de modificar este estado.
    await Future.delayed(const Duration(milliseconds: 400));
    state = products;
  }
}
