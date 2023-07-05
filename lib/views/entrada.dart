import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velneoapp/dialogos/exit_dialog.dart';
import 'package:velneoapp/routes/constants.dart';

//File file = File("assets/images/image_placeholder.png");

class EntradaView extends StatelessWidget {
  const EntradaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Entrada'),
        actions: [
          IconButton(
              onPressed: () async {
                final shouldExit = await showExitDialog(context);
                if (shouldExit) {
                  SystemNavigator.pop();
                  exit(
                      0); //TODO Peligroso, por si las dudas, que al parecer a Apple no le gusta.
                }
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido/a',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  eleccionRoute,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              label: const Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
