import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:flutter/material.dart';

import 'pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(
        product: Product(
          name: 'Camiseta +DevsEcomm',
          price: 129.90,
          icon: Icons.checkroom,
          availableSizes: ['P', 'M', 'G'],
        ),
      ),
    );
  }
}
