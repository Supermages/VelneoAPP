import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialogOneOption<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: options.keys.map((optionTitle) {
          final value = options[optionTitle];
          return ElevatedButton.icon(
            icon: const Icon(Icons.check),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            ),
            onPressed: () {
              Navigator.of(context).pop(value);
            },
            label: Text(optionTitle),
          );
        }).toList(),
      );
    },
  );
}
