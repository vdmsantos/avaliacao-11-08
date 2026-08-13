import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});
  final Product product;
  bool isActiveButton = false;
  String selectedSize = 'M';
  int quantity = 0;
  bool isFavorite = false;
  double get subTotal => product.price * quantity;

  void toggleFavorite() => isFavorite = !isFavorite;

  void selectSize(String size) {
    selectedSize = size;
  }

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity != 0) {
      quantity--;
    }
  }

  void changeActiveButton() {
    if (quantity > 0) {
      isActiveButton = true;
    }
  }
}
