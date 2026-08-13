import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});
  final Product product;
  String selectedSize = 'M';
  int quantity = 0;
  bool isFavorite = true;
  double get subTotal => product.price * quantity;

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

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

  void resetQuantity() {
    quantity = 0;
  }
}
