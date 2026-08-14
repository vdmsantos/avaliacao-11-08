// import 'package:avaliacao_componentizacao_stateful_controller/main.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.decrement,
    required this.increment,
    required this._quantity,
  });

  final VoidCallback decrement;
  final VoidCallback increment;

  final int _quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            decrement();
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color.fromARGB(136, 0, 0, 0)),
            ),
            child: const Icon(Icons.remove, size: 18, color: Colors.black87),
          ),
        ),
        SizedBox(
          width: 48,
          child: Text(
            '$_quantity',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: increment,
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
