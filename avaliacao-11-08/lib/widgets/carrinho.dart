import 'package:flutter/material.dart';
import '../controllers/cart_controller.dart';

class Carrinho extends StatefulWidget {
  final CartController cartController;

  const Carrinho({super.key, required this.cartController});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  void _abrirDialogCarrinho() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        // StatefulBuilder garante que o dialog re-renderize ao remover um item
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final items = widget.cartController.items;

            return AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 8),
                  Text('Minha sacola'),
                ],
              ),
              content: items.isEmpty
                  ? const SizedBox(
                      width: double.maxFinite,
                      child: Text('Sua sacola está vazia.'),
                    )
                  : SizedBox(
                      width: double.maxFinite,
                      height: 320,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  const Icon(Icons.checkroom, size: 40),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text('Tamanho: ${item.size}'),
                                        Text('Quantidade: ${item.quantity}'),
                                        Text(
                                          'R\$ ${item.product.price.toStringAsFixed(2)}',
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Atualiza a tela principal (ícone com contador)
                                      setState(() {
                                        widget.cartController.removeItem(item);
                                      });
                                      // Atualiza a lista interna do dialog
                                      setDialogState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Fechar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final quantidade = widget.cartController.items.length;

    return IconButton(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart, size: 28),
          if (quantidade > 0)
            Positioned(
              right: -8,
              top: -8,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$quantidade',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      onPressed: _abrirDialogCarrinho,
    );
  }
}