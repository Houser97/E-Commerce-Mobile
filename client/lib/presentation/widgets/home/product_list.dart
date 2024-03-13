import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_version/presentation/providers/providers.dart';
import 'package:flutter_version/presentation/widgets/widgets.dart';

class ProductList extends ConsumerStatefulWidget {
  const ProductList({super.key});

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends ConsumerState<ProductList> {
  String categoryFilter = 'All';
  String searchFilter = '';

  @override
  void initState() {
    super.initState();
    // Ver implementación de este provider para revisar problema de widget tree building.
    ref.read(productsByCategoryProvider.notifier).searchProductByCategory('All');
  }

  void updateSearchFilter(String filter) {
    setState(() {
      searchFilter = filter;
    });
  }

  void updateCategoryFilter(String filter) {
    setState(() {
      categoryFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsByCategoryProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Discover', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Search(updateSearchFilter: updateSearchFilter),
            const SizedBox(height: 30),
            const HeroCard(),
            const SizedBox(height: 10),
            Categories(updateProducts: updateCategoryFilter, selectedCategory: categoryFilter),
            const SizedBox(height: 10),
            GridView.builder(
                shrinkWrap: true, // Le permite ocupar solo el espacio que necesita.
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                })
          ],
        ),
      ),
    );
  }
}
