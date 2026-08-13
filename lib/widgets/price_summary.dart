import 'package:flutter/material.dart';

String _formatPrice(double value) {
  return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: ${_formatPrice(subTotal)}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
