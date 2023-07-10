import 'package:flutter/material.dart';
import 'package:velneoapp/dialogos/two_option_dialog.dart';

Future<bool> showExitEntradaScreenDialog(BuildContext context) {
  return showGenericDialogTwoOptions<bool>(
    context: context,
    title: 'Salir',
    content: '¿Esta seguro que quiere volver a la entrada?',
    optionsBuilder: () => {
      'No': false,
      'Sí': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
