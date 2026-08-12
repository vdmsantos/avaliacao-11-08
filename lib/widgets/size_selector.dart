import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/size_chip.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final Product _product;
  final String _selectedSize;

  const SizeSelector({
    super.key,
    required this._product,
    required this._selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _product.availableSizes.map((size) {
        final bool isSelected = size == _selectedSize;
        return SizeChip(
          size: size,
          type: isSelected ? SizeChipType.selected : SizeChipType.notSelected,
        );
      }).toList(),
    );
  }
}
