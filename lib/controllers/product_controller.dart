import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  final Product product;

  ProductController({required this.product});

  String selectedSize = 'M';
  int quantity = 1;
  bool isFavorite = true;

  double get subtotal => product.price * quantity;

  void selectSize(String size) {
    selectedSize = size;
  }

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 0) {
      quantity--;
    }
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
