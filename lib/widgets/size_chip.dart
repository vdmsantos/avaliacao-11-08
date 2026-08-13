import 'package:flutter/material.dart';

enum SizeChipType { selected, notSelected }

class SizeChip extends StatelessWidget {
  const SizeChip({super.key, required this.type, required this.size});

  final SizeChipType type;
  final String size;

  Color getColor() {
    switch (type) {
      case SizeChipType.selected:
        return Color(0xFFDCC9F2);
      case SizeChipType.notSelected:
        return Colors.white;
    }
  }

  Color getBorderColor() {
    switch (type) {
      case SizeChipType.selected:
        return Color(0xFFB491E0);
      case SizeChipType.notSelected:
        return Color(0xFFE0D6DD);
    }
  }

  Widget getContent() {
    switch (type) {
      case SizeChipType.selected:
        return Row(
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
        );

      case SizeChipType.notSelected:
        return Text(
          size,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 56,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: getBorderColor()),
        ),
        child: getContent(),
      ),
    );
  }
}
