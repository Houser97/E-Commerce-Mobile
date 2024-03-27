//final chartProvider;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/domain/entities/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Map<String, Product>>((ref) => CartNotifier());

class CartNotifier extends StateNotifier<Map<String, Product>> {
  CartNotifier() : super({});

  void addProduct(Product product) {
    final bool isProductInCart = state[product.id] != null;
    if (isProductInCart) {
      //TODO: incrementar cantidad de producto
    } else {
      state = {...state, product.id: product};
    }
  }
}
