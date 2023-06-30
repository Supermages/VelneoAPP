import 'package:flutter/material.dart';
import 'package:velneoapp/routes/constants.dart';
import 'package:velneoapp/views/firma.dart';

class TerminosPage extends StatefulWidget {
  const TerminosPage({Key? key}) : super(key: key);

  @override
  State<TerminosPage> createState() => _TerminosPageState();
}

class _TerminosPageState extends State<TerminosPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Condiciones'),
          bottom: const TabBar(tabs: [
            Tab(text: "LOPD"),
            Tab(text: "Condiciones"),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.46,
                  width: (MediaQuery.of(context).size.width) * 0.46,
                  child: const TabBarView(children: [
                    Text("Ejemplo"),
                    Text("Ejemplo"),
                  ]),
                ),
              ),
              const Divider(color: Colors.black),
              const Text(
                'LEE Y MARCA LAS CASILLAS PARA PODER VENDER TU RIÑÓN:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('LOPD'),
                value: isChecked1,
                onChanged: (value) {
                  setState(() {
                    isChecked1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Condiciones'),
                value: isChecked2,
                onChanged: (value) {
                  setState(() {
                    isChecked2 = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (isChecked1 && isChecked2) {
                    // Navegar a la siguiente página
                    Navigator.pushNamed(context, firmaRoute);
                  } else {
                    // Mostrar mensaje de error
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('No se ha podido continuar'),
                        content: const Text(
                          'Por favor, marque ambos términos para continuar.',
                        ),
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
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
