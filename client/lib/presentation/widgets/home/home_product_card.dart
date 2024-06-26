import 'package:flutter/material.dart';
import 'package:flutter_version/domain/entities/product.dart';
import 'package:flutter_version/presentation/screens/screens.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final String title = product.title;
    final double price = product.price;
    final double rating = product.rating;
    final String image = product.image;

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ProductScreen(
                  product: product,
                );
              }));
            },
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color.fromRGBO(240, 242, 241, 1), borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Image.network(
                image,
                height: 150,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 140, 150, 155),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18.0,
                    color: Colors.orangeAccent,
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    '$rating',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            '\$$price',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
