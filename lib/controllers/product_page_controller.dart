import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});
  final Product product;
  String selectedSize = 'M';
  int _quantity = 0;
  bool isFavorite = false;
  double get subTotal => product.price * _quantity;

  int get quantity => _quantity;

  void toggleFavorite() => isFavorite = !isFavorite;

  void selectSize(String size) {
    // TODO
  }
  void increment() {
    _quantity++;
    // TODO
  }

  void decrement() {
    if (_quantity > 0) _quantity--;
  }
}
