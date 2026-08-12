import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});
  final Product product;
  String selectedSize = '';
  int quantity = 0;
  bool isFavorite = false;
  bool isButtonEnabled = false;
  double get subTotal => product.price * quantity;

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  void selectSize(String size) {
    selectedSize = size;
    cheackButton();
  }

  void increment() {
    quantity++;
    cheackButton();
  }

  void decrement() {
    if (quantity > 0) {
      quantity--;
      cheackButton();
    }
  }

  void cheackButton() {
    if (quantity == 0 || selectedSize.isEmpty) {
      isButtonEnabled = false;
    } else {
      isButtonEnabled = true;
    }
  }
}
