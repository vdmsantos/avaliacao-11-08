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
  final ProductController _productController = ProductController(
    product: ProductPage._product,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(
          _productController.product.name,
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
                product: _productController.product,
                isFavorite: _productController.isFavorite,
                onFavoriteToggle: () {
                  setState(() {
                    _productController.toggleFavorite();
                  });
                },
              ),

              const SizedBox(height: 24),

              const SectionTitle(title: 'Tamanho'),

              const SizedBox(height: 12),

              SizeSelector(
                sizes: _productController.product.availableSizes,
                selectedSize: _productController.selectedSize,
                onSizeSelected: (size) {
                  setState(() {
                    _productController.selectSize(size);
                  });
                },
              ),

              const SizedBox(height: 28),

              const SectionTitle(title: 'Quantidade'),

              const SizedBox(height: 12),

              QuantitySelector(
                quantity: _productController.quantity,
                onIncrement: () {
                  setState(() {
                    _productController.increment();
                  });
                },
                onDecrement: () {
                  setState(() {
                    _productController.decrement();
                  });
                },
              ),

              const SizedBox(height: 28),

              PriceSummary(subTotal: _productController.subTotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: AddToBagButton(
            onPressed: _productController.quantity == 0
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        // adiciona notificação de sucesso ao adicionar produto à sacola
                        content: Text(
                          '${_productController.quantity} unidade(s) de tamanho '
                          '${_productController.selectedSize} adicionada(s) à sacola!',
                        ),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 4),
                        persist: false,
                        action: SnackBarAction(
                          label: 'DESFAZER',
                          onPressed: () {
                            setState(() {
                              _productController.resetQuantity();
                            });
                          },
                        ),
                      ),
                    );
                  },
          ),
        ),
      ),
    );
  }
}
