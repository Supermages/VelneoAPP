import 'package:flutter/material.dart';
import 'package:velneoapp/dialogos/one_option_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialogOneOption<void>(
    context: context,
    title: 'Se ha producido un error.',
    content: text,
    optionsBuilder: () => {
      'Aceptar': null,
    },
  );
}
