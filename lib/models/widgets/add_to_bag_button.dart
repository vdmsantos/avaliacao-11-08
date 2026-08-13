import 'package:flutter/material.dart';

enum ButtonState { enable, disable }

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({super.key, required this.state, this.onPressed});

  final ButtonState state;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = state == ButtonState.enable;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,

          disabledBackgroundColor: const Color(0xFFD0C8CE),
          disabledForegroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Adicionar à sacola',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
