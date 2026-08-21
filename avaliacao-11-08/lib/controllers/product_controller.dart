import '../models/product.dart';

class ProductController {
  final Product product;

  late String selectedSize;
  int quantity = 0;
  bool isFavorite = false;

  ProductController({required this.product}) {
    selectedSize = product.availableSizes.isNotEmpty
        ? product.availableSizes.first
        : 'M';
  }

  void selectSize(String size) {
    selectedSize = size;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  double getSubtotal() {
    return product.price * quantity;
  }
}