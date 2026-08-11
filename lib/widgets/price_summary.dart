import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  final double subTotal;

  const PriceSummary({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: R\$ ${subTotal.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
