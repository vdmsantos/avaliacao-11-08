import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_page_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:flutter/material.dart';

class PriceSummary extends StatefulWidget {
  const PriceSummary({super.key, required this.product});

  final Product product;

  @override
  State<PriceSummary> createState() => _PriceSummaryState();
}

class _PriceSummaryState extends State<PriceSummary> {
  late ProductController controller;

  @override
  void initState() {
    controller = ProductController(product: widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Subtotal: ${controller.subTotal}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
