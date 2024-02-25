import 'package:flutter/material.dart';
import 'package:flutter_version/presentation/screens/cart/cart_screen.dart';
import 'package:flutter_version/presentation/widgets/home/product_list.dart';
import 'package:flutter_version/presentation/widgets/shared/categories.dart';
import 'package:flutter_version/shared/data/local_products.dart';
import 'package:flutter_version/presentation/widgets/home/hero_card.dart';
import 'package:flutter_version/presentation/widgets/home/product_card.dart';
import 'package:flutter_version/presentation/widgets/shared/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(currentPage: currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: currentPage == 0 ? const ProductList() : const Cart());
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map<String, dynamic>> filteredProducts = products;
  String categoryFilter = 'All';
  String searchFilter = '';

  void updateSearchFilter(String filter) {
    setState(() {
      searchFilter = filter;
      updateProducts();
    });
  }

  void updateCategoryFilter(String filter) {
    setState(() {
      categoryFilter = filter;
      updateProducts();
    });
  }

  void updateProducts() {
    if (categoryFilter == 'All') {
      filteredProducts = products
          .where((product) => (product['title'] as String)
              .toLowerCase()
              .contains(searchFilter.toLowerCase()))
          .toList();
    } else {
      filteredProducts = products
          .where((product) =>
              (product['categories'] as List<String>)
                  .contains(categoryFilter) &&
              (product['title'] as String)
                  .toLowerCase()
                  .contains(searchFilter.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Discover',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Search(
              updateSearchFilter: updateSearchFilter,
            ),
            const SizedBox(
              height: 30,
            ),
            const HeroCard(),
            const SizedBox(
              height: 10,
            ),
            Categories(
              updateProducts: updateCategoryFilter,
              selectedCategory: categoryFilter,
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
                shrinkWrap:
                    true, // Le permite ocupar solo el espacio que necesita.
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.3),
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(product: product);
                })
          ],
        ),
      ),
    );
  }
}
