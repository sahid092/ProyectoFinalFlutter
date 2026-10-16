import 'package:flutter/material.dart';

import 'screens/bienvenida_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const CarteleraApp());

class CarteleraApp extends StatelessWidget {
  const CarteleraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartelera',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const BienvenidaScreen(),
    );
  }
}
