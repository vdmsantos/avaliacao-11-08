import 'package:flutter/material.dart';

class AppQuantitySelector extends StatelessWidget {
  const AppQuantitySelector({
    super.key,
    this.onIncrement,
    this.onDecrement,
    required this.quantity,
  });

  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black54),
            ),
            child: const Icon(Icons.remove, size: 18, color: Colors.black87),
          ),
        ),

        SizedBox(
          width: 48,
          child: Text(
            '${quantity}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),

        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black54),
            ),
            child: const Icon(Icons.add, size: 18, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
