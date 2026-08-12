
import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    super.key,
    required this.subtotal,
  });

  final double subtotal;

  String formatPrice(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

    @override
    Widget build(BuildContext context) {
      return Text(
        'Subtotal: ${formatPrice(subtotal)}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      );
    }
  }