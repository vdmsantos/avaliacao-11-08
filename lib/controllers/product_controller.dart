import '../models/product.dart';

class ProductController {
  ProductController({required this.product});

  final Product product;
  String selectedSize = 'M';
  int quantity = 0;
  bool isFavorite = false;

  double get subTotal => product.price * quantity;

  void toggleFavorite() => isFavorite = !isFavorite;

  void selectSize(String size) {
    selectedSize = size;
  }

  void increment() {
    quantity += 1;
  }

  void decrement() {
    if (quantity > 0) {
      quantity -= 1;
    }
  }
}
