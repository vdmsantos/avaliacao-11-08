import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  final String formattedSubtotal;

  const PriceSummary({super.key, required this.formattedSubtotal});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: $formattedSubtotal',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
