import 'package:flutter/material.dart';
import 'package:flutter_version/presentation/screens/screens.dart';
import 'package:flutter_version/presentation/widgets/widgets.dart';

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
    return SafeArea(child: currentPage == 0 ? const ProductList() : const Cart());
  }
}
