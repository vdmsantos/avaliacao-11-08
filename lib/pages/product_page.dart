import '../controller/product_controller.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
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
  static const Product _product = Product(
    name: 'Camiseta +DevsEcomm',
    price: 129.90,
    icon: Icons.checkroom,
    availableSizes: ['P', 'M', 'G'],
  );

  late final ProductController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProductController(initialSize: 'M');
    _controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = _product.price * _controller.quantity;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(
          _product.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Container(
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
                      child: Icon(_product.icon, color: Colors.black54),
                    ),
                    Expanded(child: ProductCard(product: _product)),
                    IconButton(
                      onPressed: _controller.toggleFavorite,
                      icon: Icon(
                        _controller.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SectionTitle(title: 'Tamanho'),
              SizeSelector(
                availableSizes: _product.availableSizes,
                selectedSize: _controller.selectedSize,
                onSizeSelected: _controller.selectSize,
              ),
              const SizedBox(height: 28),
              SectionTitle(title: 'Quantidade'),
              QuantitySelector(
                quantity: _controller.quantity,
                onIncrement: _controller.incrementQuantity,
                onDecrement: _controller.decrementQuantity,
              ),
              const SizedBox(height: 32),
              PriceSummary(subtotal: subtotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToBagButton(
        enabled: _controller.isAddToBagEnabled,
        onPressed: () {},
      ),
    );
  }
}
