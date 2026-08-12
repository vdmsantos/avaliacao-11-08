import 'package:avaliacao_componentizacao_stateful_controller/main.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/utils.dart';
import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key, required this.subtotal});

  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: ${Utils.formatPrice(subtotal)}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
