import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velneoapp/dialogos/exit_dialog.dart';
import 'package:velneoapp/routes/constants.dart';

class EntradaView extends StatelessWidget {
  const EntradaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada'),
        actions: [
          Tooltip(
            message: "Salir de la aplicación",
            child: IconButton(
                onPressed: () async {
                  final shouldExit = await showExitDialog(context);
                  if (shouldExit) {
                    SystemNavigator.pop();
                    exit(
                        0); //TODO Peligroso, por si las dudas, que al parecer a Apple no le gusta.
                  }
                },
                icon: const Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 125.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Rubicon.png',
                    width: MediaQuery.of(context).size.width * 0.80),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'Bienvenido/a',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.login, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        eleccionRoute,
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                    ),
                    label: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
