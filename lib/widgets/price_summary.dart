import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  final double subTotal;

  const PriceSummary({super.key, required this.subTotal});

  String _formatPrice(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

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
