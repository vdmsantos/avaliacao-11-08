import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/add_to_bag_button.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/price_summary.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/product_card.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/quantity_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/section_title.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/size_selector.dart';
import 'package:flutter/material.dart';

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
    _controller = ProductController(product: _product);
  }

  void _selectSize(String size) {
    setState(() {
      _controller.selectSize(size);
    });
  }

  void _increment() {
    setState(() {
      _controller.increment();
    });
  }

  void _decrement() {
    setState(() {
      _controller.decrement();
    });
  }

  void _toggleFavorite() {
    setState(() {
      _controller.toggleFavorite();
    });
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
          _product.name,
          style: TextStyle(
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
                name: _product.name,
                formattedPrice: _formatPrice(_product.price),
                icon: _product.icon,
                isFavorite: _controller.isFavorite,
                onFavoritePressed: _toggleFavorite,
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Tamanho'),
              const SizedBox(height: 12),
              SizeSelector(
                sizes: _product.availableSizes,
                selectedSize: _controller.selectedSize,
                onSizeSelected: _selectSize,
              ),
              const SizedBox(height: 28),
              const SectionTitle(title: 'Quantidade'),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: _controller.quantity,
                onDecrement: _decrement,
                onIncrement: _increment,
              ),
              const SizedBox(height: 28),
              PriceSummary(
                formattedSubtotal: _formatPrice(_controller.subTotal),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: AddToBagButton(),
        ),
      ),
    );
  }
}
