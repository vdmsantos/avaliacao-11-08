import 'package:avaliacao_componentizacao_stateful_controller/models/controllers/ProductController.dart';
import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({this.onPressed, super.key});

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: const Text(
        'Adicionar à sacola',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
