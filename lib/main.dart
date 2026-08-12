import 'package:avaliacao_componentizacao_stateful_controller/pages/shared/widgets/product_card.dart';
import 'package:avaliacao_componentizacao_stateful_controller/pages/shared/widgets/quantity_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/pages/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final double price;
  final IconData icon;
  final List<String> availableSizes;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.availableSizes,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

String _formatPrice(double value) {
  return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const Product _product = Product(
    name: 'Camiseta +DevsEcomm',
    price: 129.90,
    icon: Icons.checkroom,
    availableSizes: ['P', 'M', 'G'],
  );

  static const String _selectedSize = 'M';
  static const int _quantity = 0;
  static const bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    final double subtotal = _product.price * _quantity;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(
          _product.name,
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
              ProductCard(product: _product, isFavorite: _isFavorite),
              const SizedBox(height: 24),
              SectionTitle(label: 'Tamanho'),
              const SizedBox(height: 12),
              Row(
                children: _product.availableSizes.map((size) {
                  final bool isSelected = size == _selectedSize;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      width: 56,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFDCC9F2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFB491E0)
                              : const Color(0xFFE0D6DD),
                        ),
                      ),
                      child: isSelected
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.black87,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  size,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              size,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 28),
              SectionTitle(label: 'Quantidade'),
              const SizedBox(height: 12),
              QuantitySelector(quantity: _quantity),
              const SizedBox(height: 28),
              Text(
                'Subtotal: $subtotal',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
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
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.black,
                disabledForegroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Adicionar à sacola',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
