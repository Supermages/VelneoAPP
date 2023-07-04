import 'package:flutter/material.dart';
import 'package:velneoapp/routes/constants.dart';

class CondicionesView extends StatefulWidget {
  const CondicionesView({Key? key}) : super(key: key);

  @override
  State<CondicionesView> createState() => _CondicionesViewState();
}

class _CondicionesViewState extends State<CondicionesView> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  TabBar get _tabBar => const TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(text: "LOPD"),
          Tab(text: "Condiciones"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Condiciones'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Material(
              color: Colors.blue,
              child: _tabBar,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.5,
                  child: const TabBarView(children: [
                    Text("Ejemplo1"),
                    Text("Ejemplo2"),
                  ]),
                ),
              ),
              const Divider(color: Colors.black),
              const Text(
                'LEE EL TEXTO Y MARCA LAS CASILLAS PARA PODER VENDER TU RIÑÓN:',
                style: TextStyle(fontSize: 14),
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
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
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
                          ElevatedButton.icon(
                            icon: const Icon(Icons.check),
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
                },
                label: const Text('Aceptar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
