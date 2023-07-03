import 'package:flutter/material.dart';
import 'package:velneoapp/routes/constants.dart';

class FirmaView extends StatefulWidget {
  const FirmaView({Key? key}) : super(key: key);

  @override
  State<FirmaView> createState() => _FirmaViewState();
}

class _FirmaViewState extends State<FirmaView> {
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, eleccionRoute, (route) => false);
                  } else {
                    // Mostrar mensaje de error
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('No se ha podido continuar'),
                        content: const Text('Por favor, firma para continuar.'),
                        actions: [
                          ElevatedButton.icon(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            label: const Text('Aceptar'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
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
