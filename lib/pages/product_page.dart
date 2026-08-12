import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';
import '../widgets/add_to_bag_button.dart';
import '../widgets/price_summary.dart';
import '../widgets/product_card.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/section_title.dart';
import '../widgets/size_selector.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static const Product _product = Product(
    name: 'Camiseta +DevsEcomm',
    price: 129.90,
    icon: Icons.checkroom,
    availableSizes: ['P', 'M', 'G'],
  );

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController _prodCtrlX = ProductController(
    product: ProductPage._product,
  );

  void _toggleFavorite() {
    setState(() {
      _prodCtrlX.toggleFavorite();
    });
  }

  void _selectSize(String size) {
    setState(() {
      _prodCtrlX.selectSize(size);
    });
  }

  void _incrementQuantity() {
    setState(() {
      _prodCtrlX.increment();
    });
  }

  void _decrementQuantity() {
    setState(() {
      _prodCtrlX.decrement();
    });
  }

  void _addToBag() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${_prodCtrlX.quantity} x ${ProductPage._product.name} (${_prodCtrlX.selectedSize}) adicionado à sacola',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String _formatPrice(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(
          ProductPage._product.name,
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
              ProductCard(
                product: ProductPage._product,
                isFavorite: _prodCtrlX.isFavorite,
                onFavoriteTap: _toggleFavorite,
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Tamanho'),
              const SizedBox(height: 12),
              SizeSelector(
                sizes: ProductPage._product.availableSizes,
                selectedSize: _prodCtrlX.selectedSize,
                onSelected: _selectSize,
              ),
              const SizedBox(height: 28),
              const SectionTitle(title: 'Quantidade'),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: _prodCtrlX.quantity,
                onDecrement: _decrementQuantity,
                onIncrement: _incrementQuantity,
              ),
              const SizedBox(height: 28),
              PriceSummary(subTotal: _prodCtrlX.subTotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: AddToBagButton(
            enabled: _prodCtrlX.quantity > 0,
            onPressed: _prodCtrlX.quantity > 0 ? _addToBag : null,
          ),
        ),
      ),
    );
  }
}
