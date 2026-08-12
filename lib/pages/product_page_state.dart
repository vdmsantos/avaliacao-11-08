import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/add_to_bag_button.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/format_price.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/price_summary.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/product_card.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/quantity_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/section_tittle.dart';
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

  static const String _selectedSize = '';
  static const int _quantity = 0;
  static const bool _isFavorite = true;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

FormatPrice formatPreco = FormatPrice();

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

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
              SectionTittle(),
              const SizedBox(height: 12),
              //  size_selector_and_size_chip(
              //  selectedSize: ProductPage._selectedSize,
              //  product: ProductPage._product,
              // ),
              const SizedBox(height: 28),
              size_selector(
                product: productController.product,
                selectedSize: productController.selectedSize,
                onSelected: () => '',
              ),
              const SizedBox(height: 28),
              const Text(
                'Quantidade',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              // const Text(
              //   'Quantidade',
              //   style: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //     color: Colors.black,
              //   ),
              // ),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: productController.quantity,
                increment: () {
                  setState(() {
                    productController.increment();
                  });
                },
                descrement: () {
                  setState(() {
                    productController.decrement();
                  });
                },
              ),
              const SizedBox(height: 28),
              PriceSummary(subtotal: productController.subTotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AddToBagButton(),
    );
  }
}
