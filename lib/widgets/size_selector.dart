import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/size_chip.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final Product _product;
  final String _selectedSize;
  final Function(String) onTap;

  const SizeSelector({
    super.key,
    required this._product,
    required this._selectedSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _product.availableSizes.map((size) {
        final bool isSelected = size == _selectedSize;
        return SizeChip(
          onTap: onTap,
          size: size,
          type: isSelected ? SizeChipType.selected : SizeChipType.notSelected,
        );
      }).toList(),
    );
  }
}
