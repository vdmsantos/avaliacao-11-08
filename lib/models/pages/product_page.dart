import 'package:avaliacao_componentizacao_stateful_controller/models/controllers/product_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/product.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/product_card.dart';
import 'package:avaliacao_componentizacao_stateful_controller/models/widgets/quantity_selector.dart';
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
  String _formatPrice(double value) {
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
              const Text(
                'Tamanho',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: productController.product.availableSizes.map((size) {
                  final bool isSelected =
                      size == productController.selectedSize;
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
              const Text(
                'Quantidade',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              QuantitySelector(
                quantity: productController.quantity,
                onDecrement: () => {
                  setState(() {
                    productController.decrement();
                  }),
                },
                onIncrement: () => {
                  setState(() {
                    productController.increment();
                  }),
                },
              ),
              const SizedBox(height: 28),
              Text(
                'Subtotal: ${_formatPrice(productController.subTotal)}',
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
