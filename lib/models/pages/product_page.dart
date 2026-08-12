import 'package:avaliacao_componentizacao_stateful_controller/models/controllers/ProductController.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/add_to_bag_button.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/price_summary.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/product_card.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/quantity_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/section_title.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/size_selector.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductController productController = ProductController(
    product: Product(
      name: 'Camiseta +DevsEcomm',
      price: 129.90,
      icon: Icons.checkroom,
      availableSizes: ['P', 'M', 'G'],
    ),
  );
  @override
  Widget build(BuildContext context) {
    final double subtotal = productController.subTotal;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(
          productController.product.name,
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
                product: productController.product,
                isFavorite: productController.isFavorite,
                onPressed: () {
                  setState(() {
                    productController.toggleFavorite();
                  });
                },
              ),

              const SizedBox(height: 24),

              SectionTitle(title: 'Tamanho'),

              const SizedBox(height: 12),

              SizeSelector(
                onSizeSelected: (value) {
                  setState(() {
                    productController.selectSize(value);
                  });
                },
                product: productController.product,
                selectedSize: productController.selectedSize,
              ),
              const SizedBox(height: 28),

              SectionTitle(title: 'Quantidade'),

              const SizedBox(height: 12),

              QuantitySelector(
                onIncrement: () {
                  setState(() {
                    productController.increment();
                  });
                },
                onDecrement: () {
                  setState(() {
                    productController.decrement();
                  });
                },
                quantity: productController.quantity,
              ),

              const SizedBox(height: 28),

              PriceSummary(subtotal: subtotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: AddToBagButton(
              onPressed: productController.isButtonEnabled
                  ? () {
                      // Ação ao pressionar o botão "Adicionar à Sacola"
                    }
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
