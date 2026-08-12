import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/size_chip.dart';
import 'package:flutter/material.dart';

class size_selector extends StatelessWidget {
  const size_selector({
    super.key,
    this.onSelected,
    required this.product,
    required this.selectedSize,
  });

  final Product product;
  final String selectedSize;

  final void Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: product.availableSizes.map((size) {
        final bool isSelected = size == selectedSize;

        return SizeChip(
          size: size,
          type: isSelected ? SizeChipType.selected : SizeChipType.notSelected,
        );
      }).toList(),
    );
  }
}
