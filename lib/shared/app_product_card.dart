import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:flutter/material.dart';

class AppProductCard extends StatefulWidget {
  const AppProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    this.onPressed,
  });

  final Product product;
  final bool isFavorite;
  final VoidCallback? onPressed;

  @override
  State<AppProductCard> createState() => _AppProductCardState();
}

class _AppProductCardState extends State<AppProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9DCE6)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(widget.product.icon, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.product.price.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              widget.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
