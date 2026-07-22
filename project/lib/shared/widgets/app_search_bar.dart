import 'package:flutter/material.dart';

import 'app_text_field.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const AppSearchBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: "Axtar...",
      prefixIcon: Icons.search,
    );
  }
}