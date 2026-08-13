import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_page_controller.dart';
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

  // static const Product _product = Product(
  //   name: 'Camiseta +DevsEcomm',
  //   price: 129.90,
  //   icon: Icons.checkroom,
  //   availableSizes: ['P', 'M', 'G'],
  // );

  // static const String _selectedSize = 'M';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductController controller = ProductController(
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
          controller.product.name,
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
                product: controller.product,
                isFavorite: controller.isFavorite,
                onPressed: () {
                  setState(() {
                    controller.toggleFavorite();
                  });
                },
              ),
              const SizedBox(height: 24),
              SectionTitle(title: 'Tamanho'),
              const SizedBox(height: 12),
              SizeSelector(
                onTap: (value) {
                  setState(() {
                    controller.selectSize(value);
                  });
                },
                product: controller.product,
                selectedSize: controller.selectedSize,
              ),
              const SizedBox(height: 28),
              SectionTitle(title: 'Quantidade'),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: controller.quantity,
                decrement: () {
                  setState(() {
                    controller.decrement();
                  });
                },
                increment: () {
                  setState(() {
                    controller.increment();
                  });
                },
              ),
              const SizedBox(height: 28),
              PriceSummary(subtotal: controller.subTotal),
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
              onPressed: controller.isButtonEnabled ? () {} : null,
            ),
          ),
        ),
      ),
    );
  }
}
