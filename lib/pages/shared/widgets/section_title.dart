import 'package:avaliacao_componentizacao_stateful_controller/pages/shared/text_style.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: Text(label, style: AppTextStyle.title),
    );
  }
}
