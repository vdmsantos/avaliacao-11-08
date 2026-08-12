import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: R\$ ${subTotal.toStringAsFixed(2)}',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
