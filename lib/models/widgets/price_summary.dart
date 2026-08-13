import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key, required this.subtotal});
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: ${subtotal}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
