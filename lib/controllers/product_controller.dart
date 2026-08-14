import 'package:avaliacao_componentizacao_stateful_controller/modulo/product.dart';

class ProductController {
  ProductController({required this.product});
  final Product product;
  String selectedSize = 'M';
  int quantity = 1;
  bool isFavorite = false;
  double get subTotal => product.price * quantity;
  void toggleFavorite() => isFavorite = !isFavorite;
  void selectSize(String size) {
    //
  }

  void incrementCounter() {
    quantity++;
  }

  void decrementCounter() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
