import 'package:flutter/material.dart';
import 'package:flutter_version/shared/data/local_products.dart';

class Categories extends StatelessWidget {
  final void Function(String) updateProducts;
  final String selectedCategory;
  const Categories(
      {super.key,
      required this.updateProducts,
      required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _Categorie(
                    updateProducts: updateProducts,
                    category: category,
                    selectedCategory: selectedCategory);
              }),
        )
      ],
    );
  }
}

class _Categorie extends StatelessWidget {
  const _Categorie({
    required this.updateProducts,
    required this.category,
    required this.selectedCategory,
  });

  final void Function(String p1) updateProducts;
  final String category;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateProducts(category);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Chip(
          label: Text(
            category,
            style: TextStyle(
                color:
                    selectedCategory == category ? Colors.white : Colors.black),
          ),
          backgroundColor: selectedCategory == category
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          side: BorderSide(
            width: 1.5,
            color: selectedCategory == category
                ? Theme.of(context).colorScheme.primary
                : Colors.black,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
          ),
        ),
      ),
    );
  }
}
