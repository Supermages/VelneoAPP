import 'package:flutter/material.dart';
import 'package:velneoapp/views/eleccion.dart';

class FirmaPage extends StatefulWidget {
  const FirmaPage({Key? key}) : super(key: key);

  @override
  State<FirmaPage> createState() => _FirmaPageState();
}

class _FirmaPageState extends State<FirmaPage> {
  bool isFirmado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Firma'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Por favor, firma para continuar:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFirmado = !isFirmado;
                  });
                },
                child: Text(
                  isFirmado ? 'Firmado' : 'Firmar',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (isFirmado) {
                    // Navegar a la página de elección
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EleccionPage(),
                      ),
                    );
                  } else {
                    // Mostrar mensaje de error
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('No se ha podido continuar'),
                        content: const Text('Por favor, firma para continuar.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                  }
                  const TextStyle(fontSize: 18);
                },
                child: const Text('Continuar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
