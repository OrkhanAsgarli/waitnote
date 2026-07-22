import 'package:flutter/material.dart';

import '../../../shared/widgets/buttons/app_button.dart';
import '../../../shared/widgets/forms/app_text_field.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/app_database.dart';
import '../../../data/database/enums.dart';
import '../../../data/database/providers/database_provider.dart';
class AddTableDialog extends ConsumerStatefulWidget {
  const AddTableDialog({super.key});

  @override
  ConsumerState<AddTableDialog> createState() => _AddTableDialogState();
}

class _AddTableDialogState extends ConsumerState<AddTableDialog> {
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Yeni Masa"),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: _nameController,
              hint: "Masa adı",
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: _capacityController,
              hint: "Tutum (nəfər)",
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
  final name = _nameController.text.trim();

  if (name.isEmpty) return;

  final capacity =
      int.tryParse(_capacityController.text) ?? 4;

  final repository = ref.read(tableRepositoryProvider);

  await repository.insert(
    RestaurantTablesCompanion.insert(
      name: name,
      capacity: Value(capacity),
      displayOrder: const Value(0),
      status: const Value(TableStatus.available),
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