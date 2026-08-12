import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key, required this.subtotal});

  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: ${subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
