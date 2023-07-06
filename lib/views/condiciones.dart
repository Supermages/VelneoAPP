import 'package:flutter/material.dart';
import 'package:velneoapp/dialogos/error_dialog.dart';
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
          Tab(text: "Términos y condiciones"),
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
            child: _tabBar,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.42,
                  child: const TabBarView(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut bibendum augue, quis tincidunt arcu. Morbi cursus magna vitae nulla pretium feugiat. Vivamus faucibus accumsan gravida. Nulla vel felis eget tortor consequat sodales. Vestibulum suscipit facilisis tellus eget aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras maximus tortor molestie, sodales elit ac, auctor dolor. Nunc et sodales arcu. Quisque egestas euismod est, sit amet imperdiet purus vehicula in. Duis non nisi tincidunt, gravida enim eu, sodales ligula. Donec luctus, lacus nec sagittis fermentum, tortor lacus viverra est, nec dictum sem augue at orci. Aliquam ac accumsan augue. Nullam hendrerit rhoncus orci, vel sollicitudin tortor molestie et. Morbi imperdiet lacus vitae ipsum posuere feugiat. Aenean dictum sodales gravida. Mauris nunc velit, egestas sit amet purus id, vulputate tincidunt sem. Integer vitae justo eu augue lobortis sollicitudin. In suscipit augue bibendum sapien blandit hendrerit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut varius lacus vitae ex porta, sed egestas dolor lobortis. Mauris vel justo id nunc luctus laoreet et quis enim. Duis posuere, tortor fringilla tincidunt consequat, nunc urna viverra lacus, ac facilisis purus arcu at elit. Quisque vitae felis sem. Pellentesque nisi ante, convallis id justo quis, malesuada convallis ex. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ut condimentum enim. Proin sit amet dui nunc. Nullam ipsum nulla, euismod at mi non, convallis vehicula mi. Maecenas orci turpis, vulputate a neque quis, dapibus auctor est. Donec consequat dictum neque, et feugiat enim placerat sed. Quisque vitae est a metus vehicula lobortis. Etiam non vestibulum justo. Quisque sed diam arcu. Sed fringilla turpis at auctor gravida. Nulla congue, tellus at sodales sollicitudin, ipsum sapien tincidunt sem, id congue leo tortor sit amet leo. Vivamus faucibus sodales tellus nec aliquet. Ut non sodales velit, sit amet tincidunt lorem. Suspendisse sit amet convallis odio. Morbi at porttitor orci. Morbi dictum velit et libero condimentum feugiat. Donec mauris nulla, vehicula eu dapibus a, sollicitudin eu dui. Nunc vulputate quam a nulla vehicula euismod. Cras cursus metus nec ipsum ullamcorper, vitae luctus ligula tempor. Nunc faucibus elit eu posuere mollis. Vivamus porttitor dui quis faucibus semper. Vestibulum a feugiat orci. Donec vestibulum ut nibh vel placerat. Vestibulum ut aliquet elit, vel pharetra sem. Maecenas feugiat commodo accumsan. Ut nec vulputate erat, at sodales nunc."),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut bibendum augue, quis tincidunt arcu. Morbi cursus magna vitae nulla pretium feugiat. Vivamus faucibus accumsan gravida. Nulla vel felis eget tortor consequat sodales. Vestibulum suscipit facilisis tellus eget aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras maximus tortor molestie, sodales elit ac, auctor dolor. Nunc et sodales arcu. Quisque egestas euismod est, sit amet imperdiet purus vehicula in. Duis non nisi tincidunt, gravida enim eu, sodales ligula. Donec luctus, lacus nec sagittis fermentum, tortor lacus viverra est, nec dictum sem augue at orci. Aliquam ac accumsan augue. Nullam hendrerit rhoncus orci, vel sollicitudin tortor molestie et. Morbi imperdiet lacus vitae ipsum posuere feugiat. Aenean dictum sodales gravida. Mauris nunc velit, egestas sit amet purus id, vulputate tincidunt sem. Integer vitae justo eu augue lobortis sollicitudin. In suscipit augue bibendum sapien blandit hendrerit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut varius lacus vitae ex porta, sed egestas dolor lobortis. Mauris vel justo id nunc luctus laoreet et quis enim. Duis posuere, tortor fringilla tincidunt consequat, nunc urna viverra lacus, ac facilisis purus arcu at elit. Quisque vitae felis sem. Pellentesque nisi ante, convallis id justo quis, malesuada convallis ex. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ut condimentum enim. Proin sit amet dui nunc. Nullam ipsum nulla, euismod at mi non, convallis vehicula mi. Maecenas orci turpis, vulputate a neque quis, dapibus auctor est. Donec consequat dictum neque, et feugiat enim placerat sed. Quisque vitae est a metus vehicula lobortis. Etiam non vestibulum justo. Quisque sed diam arcu. Sed fringilla turpis at auctor gravida. Nulla congue, tellus at sodales sollicitudin, ipsum sapien tincidunt sem, id congue leo tortor sit amet leo. Vivamus faucibus sodales tellus nec aliquet. Ut non sodales velit, sit amet tincidunt lorem. Suspendisse sit amet convallis odio. Morbi at porttitor orci. Morbi dictum velit et libero condimentum feugiat. Donec mauris nulla, vehicula eu dapibus a, sollicitudin eu dui. Nunc vulputate quam a nulla vehicula euismod. Cras cursus metus nec ipsum ullamcorper, vitae luctus ligula tempor. Nunc faucibus elit eu posuere mollis. Vivamus porttitor dui quis faucibus semper. Vestibulum a feugiat orci. Donec vestibulum ut nibh vel placerat. Vestibulum ut aliquet elit, vel pharetra sem. Maecenas feugiat commodo accumsan. Ut nec vulputate erat, at sodales nunc."),
                    ),
                  ]),
                ),
              ),
              const Divider(
                color: Colors.tealAccent,
                thickness: 2,
              ),
              const Text(
                'Lee las condiciones y marca las casillas para poder continuar:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Acepto el LOPD'),
                value: isChecked1,
                onChanged: (value) {
                  setState(() {
                    isChecked1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Acepto los términos y condiciones'),
                value: isChecked2,
                onChanged: (value) {
                  setState(() {
                    isChecked2 = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(
                        Colors.lightGreenAccent),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                  ),
                  onPressed: () {
                    if (isChecked1 && isChecked2) {
                      // Navegar a la siguiente página
                      Navigator.pushNamed(context, firmaRoute);
                    } else {
                      // Mostrar mensaje de error
                      showErrorDialog(
                        context,
                        "Debes de aceptar las dos condiciones para poder progresar.",
                      );
                    }
                  },
                  label: const Text('Aceptar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
