import 'package:flutter/material.dart';

import 'app_text_field.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

const AppSearchBar({
  super.key,
  required this.controller,
  this.onChanged,
});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: "Axtar...",
      prefixIcon: Icons.search,
      onChanged: onChanged,
    );
  }
}