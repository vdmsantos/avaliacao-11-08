import 'package:avaliacao_componentizacao_stateful_controller/models/product_model.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.product,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  final Product product;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: product.availableSizes.map((size) {
        final bool isSelected = size == selectedSize;
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              onSizeSelected(size);
            },
            child: Container(
              width: 56,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFDCC9F2) : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFB491E0)
                      : const Color(0xFFE0D6DD),
                ),
              ),
              child: isSelected
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          size,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      size,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
