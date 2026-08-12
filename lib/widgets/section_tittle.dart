import 'package:flutter/material.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Tamanho',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
