import 'package:avaliacao_componentizacao_stateful_controller/features/pages/product_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    ProductPage.route: (context) => ProductPage(),
  };
}
