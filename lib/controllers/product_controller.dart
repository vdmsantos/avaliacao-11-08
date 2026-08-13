import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});

  final Product product;

  String selectedSize = 'P';
  int quantity = 4;
  bool isFavorite = true;
  double get subTotal => product.price * quantity;
  void toggleFavorite() => isFavorite = !isFavorite;

  void selectSize(String size) {
    selectedSize = size;
  }

  void increment() {
    quantity++;
  }

  void selectedSizee(String size) {}

  void decrement() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
