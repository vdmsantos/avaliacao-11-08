import 'package:flutter/material.dart';

class AppSectionTittle extends StatelessWidget {
  final String tittle;
  final TextStyle tittleTextStyle;

  const AppSectionTittle({
    super.key,
    required this.tittle,
    required this.tittleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(tittle, style: tittleTextStyle);
  }
}
