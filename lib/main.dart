import 'package:avaliacao_componentizacao_stateful_controller/controllers/product_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/add_to_tag_button.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/price_summary.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/product_card.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/quantity_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/section_tittle.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/size_selector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevsEcomm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F1F6),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductPage(),
    );
  }
}

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
              SectionTittle(title: 'Tamanho'),
              const SizedBox(height: 12),
              SizeSelector(
                onSelected: (value) {
                  setState(() {
                    productController.selectSize(value);
                  });
                },
                product: productController.product,
                selectedSize: productController.selectedSize,
              ),
              const SizedBox(height: 28),
              SectionTittle(title: 'Quantidade'),
              const SizedBox(height: 12),
              QuantitySelector(
                quantity: productController.quantity,
                onDecrement: () {
                  setState(() {
                    productController.decrement();
                  });
                },
                onIncrement: () {
                  setState(() {
                    productController.increment();
                  });
                },
              ),
              const SizedBox(height: 28),
              PriceSummary(subtotal: productController.subtotal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToTagButton(),
    );
  }
}
