import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    super.key,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
  });
  final int quantity;
  final void Function()? onIncrement;
  final void Function()? onDecrement;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            widget.onDecrement;
          },
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
            widget.quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onIncrement;
          },
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
