import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';

class ProductController {
  ProductController({required this.product});

  final Product product;

  String selectedSize = 'P';
  int quantity = 4;
  bool isFavorite = false;
  double get subTotal => product.price * quantity;
  void toggleFavorite() => isFavorite = !isFavorite;

  void selectSize(String size) {
    // TODO
  }
  void increment(int quantity) {
    if (quantity < 15) {
      this.quantity++;
    }

    if (quantity < 0) {
      print('Quantidade não pode ser menor que 0');
    }
  }

  void selectedSizee(String size) {
    if (product.availableSizes.contains(size)) {
      selectedSize = size;
    }
  }

  void decrement(int quantity) {}

  void isFavoritee(bool isFavorite) {
    ;
  }
}
