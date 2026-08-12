import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/size_chip.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    this.onSizeSelected,
    super.key,
    required this._product,
    required this._selectedSize,
  });

  final Product _product;
  final String _selectedSize;
  final void Function(String)? onSizeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _product.availableSizes.map((size) {
        final bool isSelected = size == _selectedSize;
        return SizeChip(
          onSizeSelected: onSizeSelected,
          isSelected: isSelected,
          size: size,
        );
      }).toList(),
    );
  }
}
