import 'package:flutter/material.dart';
import 'models/product.dart';
import 'pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const product = Product(
      name: 'Camiseta +DevsEcomm',
      price: 129.90,
      icon: 'checkroom',
      availableSizes: ['P', 'M', 'G'],
    );

    return MaterialApp(
      title: 'DevsEcomm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F1F6),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductPage(product: product),
    );
  }
}
