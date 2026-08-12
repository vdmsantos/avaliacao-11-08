import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  final double subtotal;

  const PriceSummary({super.key, required this.subtotal});

  String _formatPrice(double price) {
    return 'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: ${_formatPrice(subtotal)}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
