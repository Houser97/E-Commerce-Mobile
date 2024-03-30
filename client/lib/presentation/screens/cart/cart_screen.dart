import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/presentation/providers/cart/cart_providers.dart';
import 'package:flutter_version/presentation/widgets/widgets.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider).values.toList();

    if (cart.isEmpty) {
      return const Center(
        child: Text('Cart empty'),
      );
    }

    // for (final product in cart.values) {
    //   double price = product['price'];
    //   int quantity = product['quantity'];

    //   totalPrice += price * quantity;
    // }

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final product = cart[index];
                    final id = product.id;
                    final title = product.title;
                    final price = product.price;
                    final image = product.image;
                    final currentQty = product.quantity;
                    return ProductCart(
                      id: id,
                      image: image,
                      title: title,
                      price: price,
                      currentQty: currentQty!,
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Total:0',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
