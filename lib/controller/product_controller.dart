import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  String _selectedSize;
  int _quantity;
  bool _isFavorite;
  bool get isAddToBagEnabled => _quantity > 0;

  ProductController({
    required String initialSize,
    int initialQuantity = 0,
    bool initialFavorite = false,
  }) : _selectedSize = initialSize,
       _quantity = initialQuantity,
       _isFavorite = initialFavorite;

  String get selectedSize => _selectedSize;
  int get quantity => _quantity;
  bool get isFavorite => _isFavorite;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}
