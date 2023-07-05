import 'package:flutter/material.dart';
import 'package:velneoapp/dialogos/two_option_dialog.dart';

Future<bool> showExitDialog(BuildContext context) {
  return showGenericDialogTwoOptions<bool>(
    context: context,
    title: 'Salir',
    content: '¿Esta seguro de que quiere salir de la aplicación?',
    optionsBuilder: () => {
      'No': false,
      'Sí': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
