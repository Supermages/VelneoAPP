import 'package:flutter/material.dart';
import 'package:velneoapp/dialogos/exit_entrada_screen.dart';
import 'package:velneoapp/routes/constants.dart';

class EleccionView extends StatefulWidget {
  const EleccionView({Key? key}) : super(key: key);

  @override
  State<EleccionView> createState() => _EleccionViewState();
}

class _EleccionViewState extends State<EleccionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Tooltip(
            message: "Volver a entrada",
            child: IconButton(
              onPressed: () async {
                final shouldExitToScreen =
                    await showExitEntradaScreenDialog(context);
                if (shouldExitToScreen) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(entradaRoute, (route) => false);
                }
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ),
          Tooltip(
            message: "Ajustes",
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, configRoute);
              },
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
        title: const Text("Página de elección"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.description),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                  fixedSize: const MaterialStatePropertyAll(Size(240, 55))),
              onPressed: () {
                Navigator.pushNamed(context, partesRoute);
              },
              label: const Text(
                'Partes',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.article),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  fixedSize: const MaterialStatePropertyAll(Size(240, 55))),
              onPressed: () {
                Navigator.pushNamed(context, albaranesRoute);
              },
              label: const Text(
                'Albaranes de venta',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
