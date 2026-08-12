import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final IconData icon;
  final List<String> availableSizes;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.availableSizes,
  });
}
