import 'package:flutter/material.dart';

import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';

class AddTableDialog extends StatefulWidget {
  const AddTableDialog({super.key});

  @override
  State<AddTableDialog> createState() => _AddTableDialogState();
}

class _AddTableDialogState extends State<AddTableDialog> {
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
            onPressed: () {
              // TODO: Riverpod + Repository
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}