
import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_controler.dart';
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

  static const String route = '/productpage';
  

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController productController = ProductController(
    product: Product(
    name: 'Camiseta +DevsEcomm',
    price: 129.90,
    icon: Icons.checkroom,
    availableSizes: ['P', 'M', 'G'],
  ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(productController.product.name),
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
                onPressed: () => setState(productController.toggleFavorite),
              ),
              const SizedBox(height: 24),
              const SectionTitle(),
              const SizedBox(height: 12),
              SizeSelector(
                sizes: productController.product.availableSizes,
                selectedSize: productController.selectedSize,
                onSelected: (size) =>
                    setState(() => productController.selectSize(size)),
              ),
              const SizedBox(height: 28),
              const Text('Quantidade',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: productController.quantity,
                onIncrement: () {
                  setState(() {
                    productController.increment();
                  });
                },
                onDecrement: () => setState(productController.decrement),
              ),
              const SizedBox(height: 28),
              PriceSummary(subtotal: productController.subTotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToBagButton(
        quantity: productController.quantity,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produto adicionado à sacola')),
          );
        },
      ),
    );
  }
}
