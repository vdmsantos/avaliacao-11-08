import 'package:flutter/material.dart';

import 'size_chip.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: sizes
          .map(
            (size) => SizeChip(
              size: size,
              isSelected: size == selectedSize,
              onTap: () => onSelected(size),
            ),
          )
          .toList(),
    );
  }
}
