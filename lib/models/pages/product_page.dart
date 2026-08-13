import 'package:avaliacao_componentizacao_stateful_controller/models/controllers/product_controller.dart';
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
      name: 'Camisa',
      price: 129,
      icon: Icons.shop_sharp,
      availableSizes: ['P', 'M', 'G'],
    ),
  );
  // static const Product _product = Product(
  String formatPrice(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

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
                onPressed: () {
                  setState(() {
                    productController.toggleFavorite();
                  });
                },
                product: productController.product,
                isFavorite: productController.isFavorite,
              ),
              const SizedBox(height: 24),
              SectionTitle(subtitle: 'Tamanho'),
              const SizedBox(height: 12),
              SizeSelector(
                onSelected: (value) {
                  setState(() {
                    productController.selectSize(value);
                  });
                },
                avaliableSizes: productController.product.availableSizes,
                selectedSize: productController.selectedSize,
              ),
              const SizedBox(height: 28),
              SectionTitle(subtitle: 'Quantidade'),
              const SizedBox(height: 12),

              QuantitySelector(
                quantity: productController.quantity,
                onDecrement: () {
                  setState(() {
                    productController.decrement();
                    productController.changeActiveButton();
                  });
                },
                onIncrement: () {
                  setState(() {
                    productController.increment();
                    productController.changeActiveButton();
                  });
                },
              ),
              const SizedBox(height: 28),
              PriceSummary(subtotal: productController.subTotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: AddToBagButton(
            state: productController.quantity > 0
                ? ButtonState.enable
                : ButtonState.disable,
            onPressed: () {
              print('cliquei em adicionar à sacola');
            },
          ),
        ),
      ),
    );
  }
}
