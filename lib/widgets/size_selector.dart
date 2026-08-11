import 'package:flutter/material.dart';
import 'size_chip.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: sizes.map((size) {
        return SizeChip(
          size: size,
          isSelected: size == selectedSize,
          onTap: () => onSizeSelected(size),
        );
      }).toList(),
    );
  }
}
