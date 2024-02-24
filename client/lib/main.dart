import 'package:flutter/material.dart';
import 'package:flutter_version/config/theme/app_theme.dart';
import 'package:flutter_version/pages/home.dart';
import 'package:flutter_version/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping Cart',
        theme: AppTheme().getTheme(),
        home: const HomePage(),
      ),
    );
  }
}