import 'package:avaliacao_componentizacao_stateful_controller/widgets/add_to_gab_button.dart';
import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';
import '../widgets/size_selector.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/price_summary.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final ProductController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductController(product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCard(
              product: widget.product,
              isFavorite: controller.isFavorite,
              onFavoriteTap: () {
                setState(() {
                  controller.toggleFavorite();
                });
              },
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Tamanho'),
            SizedBox(height: 8),
            SizeSelector(
              sizes: widget.product.availableSizes,
              selectedSize: controller.selectedSize,
              onSizeSelected: (size) {
                setState(() {
                  controller.selectSize(size);
                });
              },
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'Quantidade'),
            QuantitySelector(
              quantity: controller.quantity,
              onIncrement: () {
                setState(() {
                  controller.increment();
                });
              },
              onDecrement: () {
                setState(() {
                  controller.decrement();
                });
              },
            ),
            SizedBox(height: 8),
            PriceSummary(subTotal: controller.subTotal),
            Spacer(),
            AddToBagButton(
              enabled: controller.quantity > 0,
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Adicionado à sacola!')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
