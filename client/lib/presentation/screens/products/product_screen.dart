import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/presentation/providers/cart/cart_providers.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _ProductDetails(
        product: product,
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;

  const _ProductDetails({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final String image = product.image;
    final String title = product.title;
    final double rating = product.rating;
    final double price = product.price;

    const space = SizedBox(
      height: 10,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Product Image
            Expanded(
              child: Image.network(
                image,
              ),
            ),
            space,

            _ProductTitle(title: title),
            space,

            _ProductRating(rating: rating),
            space,
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non lorem id massa iaculis vestibulum. Vivamus nunc velit, pretium ac consequat eget, tempus laoreet lacus.'),
            space,
            Row(
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                _ProductAddButton(product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProductAddButton extends ConsumerWidget {
  const _ProductAddButton({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addProduct(Product product) {
      ref.read(cartProvider.notifier).addProduct(product);
    }

    void productMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          addProduct(product);
          productMessage("Product added.");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(
            vertical: 25,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: const Text(
          'Add to Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ProductRating extends StatelessWidget {
  const _ProductRating({
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Row(children: [
            const Icon(
              Icons.star,
              size: 18.0,
              color: Colors.orangeAccent,
            ),
            Text('$rating')
          ]),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text('117 Reviews')
      ],
    );
  }
}

class _ProductTitle extends StatelessWidget {
  const _ProductTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 100, 121),
          ),
          child: const Text(
            '% On sale',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
