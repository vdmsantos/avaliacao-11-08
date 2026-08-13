import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: sizes.map((size) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SizeChip(
            size: size,
            isSelected: size == selectedSize,
            onTap: () {
              onSizeSelected(size);
            },
          ),
        );
      }).toList(),
    );
  }
}

class SizeChip extends StatelessWidget {
  const SizeChip({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  const Icon(Icons.check, size: 14, color: Colors.black87),
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
    );
  }
}
