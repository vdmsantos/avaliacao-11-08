import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const AddToBagButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          disabledBackgroundColor: Colors.grey,
        ),
        child: const Text(
          'ADICIONAR À SACOLA',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
