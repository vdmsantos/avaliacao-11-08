import 'package:flutter/material.dart';

class AppSizeSelector extends StatelessWidget {
  const AppSizeSelector({
    required this.onPressed,
    super.key,
    required this.availableSizes,
    required this.selectedSize,
  });

  final List<String> availableSizes;
  final String selectedSize;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: availableSizes.map((size) {
        final bool isSelected = size == selectedSize;
        return Padding(
          padding: const EdgeInsets.only(right: 12),

          child: GestureDetector(
            onTap: () {
              onPressed(size);
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
