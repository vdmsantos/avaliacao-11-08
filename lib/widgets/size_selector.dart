import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final Function(String) onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];

    for (var i = 0; i < sizes.length; i++) {
      String tamanhoAtual = sizes[i];
      bool selecionado = tamanhoAtual == selectedSize;

      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SizeChip(
            label: tamanhoAtual,
            isSelected: selecionado,
            onTap: () {
              onSizeSelected(tamanhoAtual);
            },
          ),
        ),
      );
    }

    return Row(children: chips);
  }
}

class SizeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color corFundo;
    Color corBorda;

    if (isSelected) {
      corFundo = Colors.deepPurple.shade50;
      corBorda = Colors.deepPurple;
    } else {
      corFundo = Colors.white;
      corBorda = Colors.grey.shade300;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: corFundo,
          border: Border.all(color: corBorda),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isSelected
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check, size: 14, color: Colors.deepPurple),
                  SizedBox(width: 4),
                  Text(label, style: TextStyle(color: Colors.deepPurple)),
                ],
              )
            : Text(label),
      ),
    );
  }
}
