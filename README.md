DevsEcomm - Tela de Produto

Projeto Flutter desenvolvido como exercício de componentização, gerenciamento de estado com controller e organização de código.

A aplicação apresenta uma tela de detalhes de produto na qual o usuário pode selecionar um tamanho, definir a quantidade, favoritar o produto e acompanhar a atualização automática do subtotal.

Funcionalidades

Seleção de tamanho com destaque visual e ícone de confirmação

Controle de quantidade com limite mínimo de zero

Cálculo automático do subtotal

Alternância do estado de favorito

Botão de adicionar à sacola desabilitado quando a quantidade é zero

Feedback por SnackBar ao adicionar o produto à sacola

Interface dividida em componentes reutilizáveis

Tecnologias utilizadas

Flutter

Dart

Material Design 3

StatefulWidget e setState

Controller em Dart para gerenciamento do estado e das regras de negócio

Arquitetura

lib/
├── main.dart
├── controllers/
│   └── product_controller.dart
├── models/
│   └── product.dart
├── pages/
│   └── product_page.dart
└── widgets/
    ├── add_to_bag_button.dart
    ├── price_summary.dart
    ├── product_card.dart
    ├── quantity_selector.dart
    ├── section_title.dart
    └── size_selector.dart

Responsabilidades

Product: representa os dados do produto.

ProductController: guarda o estado e concentra as regras de seleção, quantidade, favorito e subtotal.

ProductPage: conecta o controller à interface e solicita sua reconstrução com setState.

widgets/: contém componentes visuais que recebem dados e callbacks, sem regras de negócio.

Componentes

ProductCard: exibe ícone, nome, preço e favorito.

SectionTitle: título reutilizável das seções.

SizeSelector e SizeChip: exibem e controlam a seleção de tamanhos.

QuantitySelector: apresenta os controles de quantidade.

PriceSummary: exibe o subtotal formatado.

AddToBagButton: representa o botão de adicionar à sacola e seus estados habilitado e desabilitado.

Como executar

Pré-requisitos

Flutter SDK instalado

Emulador Android, simulador iOS ou dispositivo físico configurado

Passos

Clone o repositório:

git clone https://github.com/vdmsantos/avaliacao-11-08.git

Entre na pasta do projeto:

cd avaliacao-11-08

Instale as dependências:

flutter pub get

Execute a aplicação:

flutter run

Verificação de qualidade

Para executar a análise estática:

flutter analyze

Para executar os testes:

flutter test

Regras implementadas

A quantidade nunca fica abaixo de zero.

O subtotal é calculado pelo controller com base no preço e na quantidade.

A interface reage às alterações do controller por meio de setState.

Os componentes recebem dados e callbacks e não concentram regras de negócio.

Classes usam UpperCamelCase, métodos e variáveis usam lowerCamelCase e arquivos usam snake_case.

Contexto acadêmico

Projeto desenvolvido para praticar componentização de interfaces Flutter, separação de responsabilidades e gerenciamento de estado com uma classe controller.