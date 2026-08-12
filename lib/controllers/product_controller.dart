import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});

  final Product product;

  String selectedSize = 'M';
  int quantity = 0;
  bool isFavorite = false;

  double get subtotal => product.price * quantity;

  void toggleFavorite() => isFavorite = !isFavorite;

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity > 0 ? quantity-- : null;
  }

  void selectSize(String size) {
    selectedSize = size;
  }
}
