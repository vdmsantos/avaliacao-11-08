import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:flutter/material.dart';

class ProdutoController {
  ProdutoController();

  final Product product = const Product(
    name: 'Camiseta +DevsEcomm',
    price: 199.99,
    icon: Icons.checkroom,
    availableSizes: ['P', 'M', 'G', 'GG'],
  );

  String selectedSize = 'M';
  int quantity = 0;
  bool isFavorite = true;
  bool isActiveButton = false;

  double subTotal = 0;

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  void selectSize(String size) {
    selectedSize = size;
  }

  void incrementQuantity() {
    quantity++;
    subTotal = product.price * quantity;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
      subTotal = product.price * quantity;
    }
  }

  void validateButton() {
    if (quantity > 0) {
      isActiveButton = true;
    } else {
      isActiveButton = false;
    }
  }

  String formatPrice(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
