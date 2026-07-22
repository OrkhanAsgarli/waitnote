import 'package:flutter/material.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({super.key});

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Yeni Kateqoriya"),

      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Kateqoriya adı",
        ),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Ləğv et"),
        ),

        FilledButton(
          onPressed: () {
            Navigator.pop(context, controller.text.trim());
          },
          child: const Text("Əlavə et"),
        ),
      ],
    );
  }
}