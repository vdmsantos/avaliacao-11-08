import 'package:avaliacao_componentizacao_stateful_controller/pages/product_page.dart';
import 'package:avaliacao_componentizacao_stateful_controller/routes.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      title: 'Camiseta +DevsEcomm',
      initialRoute: ProductPage.route,
    );
  }
}

