import 'package:flutter/material.dart';
import '../models/product.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart'; // 1. IMPORT DO CONTROLLER DO CARRINHO
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';
import '../widgets/size_selector.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/price_summary.dart';
import '../widgets/add_to_bag_button.dart';
import '../widgets/carrinho.dart'; // 2. IMPORT DO WIDGET CARRINHO

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final ProductController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProductController(product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
  appBar: AppBar(
  backgroundColor: const Color(0xFFF9F1F6),
  title: Text(
    widget.product.name,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  actions: [
    // Remova o "const" e passe a variável cartController aqui
    Carrinho(cartController: cartController),
    const SizedBox(width: 12),
  ],
),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              ProductCard(
                productName: widget.product.name,
                price: widget.product.price,
                icon: widget.product.icon,
                isFavorite: _controller.isFavorite,
                onFavoriteToggle: () {
                  setState(() {
                    _controller.toggleFavorite();
                  });
                },
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Tamanho'),
              const SizedBox(height: 12),
              SizeSelector(
                sizes: widget.product.availableSizes,
                selectedSize: _controller.selectedSize,
                onSizeSelected: (size) {
                  setState(() {
                    _controller.selectSize(size);
                  });
                },
              ),
              const SizedBox(height: 28),
              const SectionTitle(title: 'Quantidade'),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: _controller.quantity,
                onIncrement: () {
                  setState(() {
                    _controller.incrementQuantity();
                  });
                },
                onDecrement: () {
                  setState(() {
                    _controller.decrementQuantity();
                  });
                },
              ),
              const SizedBox(height: 28),
              PriceSummary(subtotal: _controller.getSubtotal()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: AddToBagButton(
            isEnabled: _controller.quantity > 0,
            onPressed: () {
              // 4. ADICIONA O ITEM AO CARRINHO E ATUALIZA A TELA (setState)
              setState(() {
                cartController.addItem(
                  widget.product,
                  _controller.selectedSize,
                  _controller.quantity,
                );
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Adicionado ${_controller.quantity}x ${widget.product.name} (tamanho ${_controller.selectedSize}) à sacola!',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}