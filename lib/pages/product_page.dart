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
  ProductController productController = ProductController(
    product: Product(
      name: 'Camiseta +DevsEcomm',
      price: 129.90,
      icon: Icons.checkroom,
      availableSizes: ['P', 'M', 'G', 'GG'],
    ),
  );
  @override
  Widget build(BuildContext context) {
    final double subtotal =
        productController.product.price * productController.quantity;

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
              //----widget product_card----
              ProductCard(
                onPressed: () {
                  setState(() {
                    productController.toggleFavorite();
                  });
                },
                product: productController.product,
                isFavorite: productController.isFavorite,
              ),
              const SizedBox(height: 24),
              //----widget section_title----
              SectionTitle(textTitle: "Tamanho"),
              const SizedBox(height: 12),
              // ----widget size_selector----
              SizeSelector(
                onTap: (value) {
                  setState(() {
                    productController.selectSize(value);
                  });
                },
                product: productController.product,
                selectedSize: productController.selectedSize,
              ),
              const SizedBox(height: 28),
              // ----widget section_title----
              SectionTitle(textTitle: "Quantidade"),
              const SizedBox(height: 12),
              // ----widget quantity_selector----
              QuantitySelector(
                onDrencet: () {
                  setState(() {
                    productController.decrement();
                  });
                },
                onIncrement: () {
                  setState(() {
                    productController.increment();
                  });
                },
                quantity: productController.quantity,
              ),

              const SizedBox(height: 28),
              // ----widget price_summary----
              PriceSummary(subtotal: subtotal),
            ],
          ),
        ),
      ),

      bottomNavigationBar: AddToBagButton(
        onPressed: productController.quantity > 0 ? () {} : null,
      ),
    );
  }
}
