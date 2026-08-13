import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});
  final Product product;
  String selectedSize = '';
  int _quantity = 0;
  bool isFavorite = false;
  double get subTotal => product.price * _quantity;
  bool isButtonEnabled = false;

  int get quantity => _quantity;

  void toggleFavorite() => isFavorite = !isFavorite;

  void selectSize(String size) {
    selectedSize = size;
    checkButton();
  }

  void increment() {
    _quantity++;
    checkButton();
  }

  void decrement() {
    if (_quantity > 0) _quantity--;
    checkButton();
  }

  void checkButton() {
    if (selectedSize.isNotEmpty && _quantity > 0) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }
}
