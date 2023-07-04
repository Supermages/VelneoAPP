import 'package:flutter/material.dart';
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
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                entradaRoute,
                (route) => false,
              );
            },
            icon: const Icon(Icons.exit_to_app),
          )
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
                  fixedSize: const MaterialStatePropertyAll(Size(215, 55))),
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
                  fixedSize: const MaterialStatePropertyAll(Size(215, 55))),
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
