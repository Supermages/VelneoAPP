import 'package:flutter/material.dart';
import 'package:velneoapp/dialogos/two_option_dialog.dart';

Future<bool> showDeleteFileDialog(BuildContext context) {
  return showGenericDialogTwoOptions<bool>(
    context: context,
    title: 'Eliminar',
    content: '¿Esta seguro que quiere eliminar este parte?',
    optionsBuilder: () => {
      'No': false,
      'Sí': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
