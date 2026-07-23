import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/buttons/app_button.dart';
import '../../../shared/widgets/forms/app_text_field.dart';

import '../../../data/database/app_database.dart';
import '../../../data/database/providers/database_provider.dart';

class AddProductDialog extends ConsumerStatefulWidget {
  const AddProductDialog({super.key});

  @override
  ConsumerState<AddProductDialog> createState() =>
      _AddProductDialogState();
}

class _AddProductDialogState
    extends ConsumerState<AddProductDialog> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Yeni Məhsul"),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: _nameController,
              hint: "Məhsul adı",
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: _priceController,
              hint: "Qiymət (AZN)",
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Ləğv et"),
        ),

        SizedBox(
          width: 120,
          child: AppButton(
            text: "Əlavə et",
            onPressed: () async {
              final name =
                  _nameController.text.trim();

              if (name.isEmpty) return;

              final price =
                  ((double.tryParse(
                              _priceController.text) ??
                          0) *
                      100)
                      .round();

              final repository =
                  ref.read(productRepositoryProvider);

              await repository.insert(
                ProductsCompanion.insert(
                  categoryId: 1, // müvəqqəti
                  name: name,
                  price: price,
                ),
              );

              if (mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ],
    );
  }
}