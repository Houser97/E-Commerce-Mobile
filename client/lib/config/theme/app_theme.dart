import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 72, 200, 127),
          primary: const Color.fromARGB(255, 72, 200, 127),
          secondary: const Color.fromRGBO(240, 242, 241, 1),
        ),
      );
}
