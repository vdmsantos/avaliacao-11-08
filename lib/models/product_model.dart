import 'package:flutter/material.dart';

class Product {
  final String name;
  final IconData icon;
  final List<String> availableSizes;
  final Map<String, double> price;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.availableSizes,
  });
}
