import 'package:flutter/material.dart';
import '../models/product.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';
import '../widgets/size_selector.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/price_summary.dart';
import '../widgets/add_to_bag_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final ProductController _prodCtrlX;

  @override
  void initState() {
    super.initState();
    _prodCtrlX = ProductController(
      product: const Product(
        name: 'Camisa Postal dude',
        price: 79.90,
        imageUrl:
            'https://runningwithscissors.com/wp-content/uploads/2025/03/Shirt_Black_P2_GetMilk_Front-1.jpg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCard(
              product: _prodCtrlX.product,
              isFavorite: _prodCtrlX.isFavorite,
              onFavoriteToggle: () {
                setState(() {
                  _prodCtrlX.toggleFavorite();
                });
              },
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Tamanho'),
            const SizedBox(height: 12),
            SizeSelector(
              sizes: _prodCtrlX.availableSizes,
              selectedSize: _prodCtrlX.selectedSize,
              onSizeSelected: (size) {
                setState(() {
                  _prodCtrlX.selectSize(size);
                });
              },
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Quantidade'),
            const SizedBox(height: 12),
            QuantitySelector(
              quantity: _prodCtrlX.quantity,
              onIncrement: () {
                setState(() {
                  _prodCtrlX.increment();
                });
              },
              onDecrement: () {
                setState(() {
                  _prodCtrlX.decrement();
                });
              },
            ),
            const Spacer(),
            PriceSummary(subTotal: _prodCtrlX.subTotal),
            const SizedBox(height: 16),
            AddToBagButton(enabled: _prodCtrlX.quantity > 0, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
