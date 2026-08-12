import 'package:avaliacao_componentizacao_stateful_controller/features/controllers/product_controller.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/app_quantity_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/app_section_tittle.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/app_size_selector.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/widgets/app_elevated_button.dart';
import 'package:avaliacao_componentizacao_stateful_controller/shared/app_product_card.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static String route = '/product';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProdutoController produtoController = ProdutoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F1F6),
        title: Text(
          produtoController.product.name,
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
              AppProductCard(
                isFavorite: produtoController.isFavorite,
                product: produtoController.product,
                onPressed: () {
                  setState(() {
                    produtoController.toggleFavorite();
                  });
                },
              ),
              const SizedBox(height: 24),

              AppSectionTittle(
                tittle: 'Tamanhos',
                tittleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              AppSizeSelector(
                onPressed: (value) => setState(() {
                  produtoController.selectSize(value);
                }),
                availableSizes: produtoController.product.availableSizes,
                selectedSize: produtoController.selectedSize,
              ),
              const SizedBox(height: 28),
              AppSectionTittle(
                tittle: 'Quantidade',
                tittleTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              AppQuantitySelector(
                quantity: produtoController.quantity,
                onIncrement: () => setState(() {
                  produtoController.incrementQuantity();
                  produtoController.validateButton();
                }),
                onDecrement: () => setState(() {
                  produtoController.decrementQuantity();
                  produtoController.validateButton();
                }),
              ),
              const SizedBox(height: 28),
              Text(
                'Subtotal: ${produtoController.formatPrice(produtoController.subTotal)}',
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
            child: AppElevatedButton(
              onPressed: produtoController.isActiveButton
                  ? () {
                      print(
                        'Produto adicionado à sacola: ${produtoController.product.name}, Tamanho: ${produtoController.selectedSize}, Quantidade: ${produtoController.quantity}, Subtotal: ${produtoController.formatPrice(produtoController.subTotal)}',
                      );
                    }
                  : null,
              child: AppSectionTittle(
                tittle: 'Adicionar à sacola',
                tittleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
