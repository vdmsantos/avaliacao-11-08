import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this._quantity,
    this.onDecrement,
    this.onIncrement,
  });

  final int _quantity;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      //+
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
          //Numero
          width: 48,
          child: Text(
            '$_quantity',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            //+
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
