import 'package:avaliacao_componentizacao_stateful_controller/main.dart';
import 'package:avaliacao_componentizacao_stateful_controller/widgets/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Atualiza os dados do produto', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Subtotal: R\$ 129,90'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
    expect(find.text('Subtotal: R\$ 259,80'), findsOneWidget);

    await tester.tap(find.text('P'));
    await tester.pump();

    final sizeSelector = tester.widget<SizeSelector>(find.byType(SizeSelector));
    expect(sizeSelector.selectedSize, 'P');

    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
    }

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Subtotal: R\$ 0,00'), findsOneWidget);
  });
}
