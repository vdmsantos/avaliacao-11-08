import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/format_price.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final dynamic product;
  final bool isFavorite;

  const ProductCard({super.key, this.product, required this.isFavorite});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late ProductController controller;

  @override
  initState() {
    controller = ProductController(product: widget.product);
    super.initState();
  }

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
                  FormatPrice().format(widget.product.price),
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                controller.toggleFavorite();
              });
            },
            icon: Icon(
              controller.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
