import 'package:flutter/material.dart';
import 'package:velneoapp/routes/constants.dart';

class TerminosPage extends StatefulWidget {
  const TerminosPage({Key? key}) : super(key: key);

  @override
  State<TerminosPage> createState() => _TerminosPageState();
}

class _TerminosPageState extends State<TerminosPage> {
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
            preferredSize: Size.fromHeight(50),
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
                  height: (MediaQuery.of(context).size.height) - 470,
                  child: const TabBarView(children: [
                    Text(
                        "Ejemplo1huhujhfuahsdfihsduihfsauihfuiahefuibauisfbeuebfuebubfauebiubasjbdfdfebueueuabsebgfyfyugbsukffbash"),
                    Text(
                        "Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus.Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus.Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus.Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus.Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus.Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus.Cras faucibus tempus euismod. Maecenas non diam consequat felis fermentum egestas. Phasellus lacinia varius imperdiet. Nam ultricies efficitur neque vitae lobortis. Quisque id lorem lectus. Vestibulum purus neque, porta quis tempor id, maximus at libero. Praesent porta at ligula in vestibulum. Etiam dapibus metus aliquet congue maximus. Duis ut porta ante. Sed in laoreet ex, sed lobortis dui. Vestibulum non mi non metus aliquam sollicitudin. Fusce lobortis vitae neque elementum facilisis. Donec elementum tempor iaculis. Fusce nulla mi, ultricies vestibulum cursus sed, tincidunt sed lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce accumsan metus et velit egestas, ac interdum mauris cursus."),
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
              ElevatedButton.icon(
                icon: Icon(Icons.check),
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
