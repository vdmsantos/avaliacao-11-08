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


  /*tatic const Product _product = Product(
    name: 'Camiseta +DevsEcomm',
    price: 129.90,
    icon: Icons.checkroom,
    availableSizes: ['P', 'M', 'G'],
  );*/