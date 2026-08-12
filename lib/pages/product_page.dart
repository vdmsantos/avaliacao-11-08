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
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final ProductController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductController(
      product: Product(
        name: 'Camiseta +DevsEcomm',
        price: 129.90,
        icon: Icons.checkroom,
        availableSizes: ['P', 'M', 'G'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.product.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCard(
              product: controller.product,
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
              sizes: controller.product.availableSizes,
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
              onPressed: controller.quantity > 0
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Adicionado à sacola!')),
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
