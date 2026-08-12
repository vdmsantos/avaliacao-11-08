import 'package:avaliacao_componentizacao_stateful_controller/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductController {
  String selectedSize = 'M';
  int quantity = 0;
  bool isFavorite = true;
  final int maxQuantity = 10;

  Product product = Product(
    name: 'Camiseta +DevsEcomm',
    icon: Icons.checkroom,
    availableSizes: ['PP', 'P', 'M', 'G', 'GG'],
    price: {'PP': 89.90, 'P': 99.90, 'M': 109.90, 'G': 139.90, 'GG': 189.90},
  );

  double get selectedPrice {
    return product.price[selectedSize] ?? 0;
  }

  void increaseQuantity() {
    if (quantity < maxQuantity) quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  void selectSize(String size) {
    selectedSize = size;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  //double multiplySubtotal(double price, int quantity) {return price * quantity;}
  double get subtotal => selectedPrice * quantity;

  void addToCart() {}
}
