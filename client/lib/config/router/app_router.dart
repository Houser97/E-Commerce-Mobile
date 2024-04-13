import 'package:flutter_version/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/product/:id',
    builder: (context, state) => const ProductScreen(product: product),
  )
]);
